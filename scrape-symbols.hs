{- cabal:
build-depends: base, scalpel, pretty-show, text
-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase #-}

import Data.Char (chr)
import Text.HTML.Scalpel
import Control.Applicative
import Text.Show.Pretty
import Data.Text (Text)
import qualified Data.Text as T
import System.Environment

type Sym = (Text, Bool, Text)

getSymbolTable :: String -> IO (Maybe [Sym])
getSymbolTable arg =
  scrapeURLWithConfig
    Config{ decoder = utf8Decoder, manager = Nothing}
    ("https://typst.app/docs/reference/symbols/" <> arg <> "/")
    fetchSymbols
 where
  fetchSymbols = chroots ("li" @: [match codepoint]) pair

  codepoint "data-codepoint" _ = True
  codepoint _ _ = False

  pair = do
    accent <- (== "true") <$> attr "data-accent" "li"
    name <- T.drop 7 . T.pack <$> attr "id" "li"
    cp <- attr "data-codepoint" "li"

    chroot "button" $ do
      name <- T.pack <$> text "code"
      let txt = T.singleton $ chr (read cp)
      pure (name, accent, txt)

getShorthand :: String -> IO (Maybe [(Text, Text)])
getShorthand arg =
  scrapeURLWithConfig
    Config{ decoder = utf8Decoder, manager = Nothing}
    ("https://typst.app/docs/reference/symbols/" <> arg <> "/")
    fetchSymbols
 where
  fetchSymbols = chroots ("li" @: [match codepoint]) pair

  codepoint "data-codepoint" _ = True
  codepoint _ _ = False

  pair = do
    name <- T.drop 7 . T.pack <$> attr "id" "li"
    shorthand <- T.pack <$> attr "data-math-shorthand" "li"
    pure (shorthand, name)

main = do
  args <- getArgs
  case args of
    "shorthand":_ -> getShorthand "sym" >>=
                        maybe (error "Got Nothing!")
                        (pPrint . filter (not . T.null . fst))
    x:_ -> getSymbolTable x >>= maybe (error "Got Nothing!") pPrint
    [] -> putStrLn $ "Provide either sym or emoji as argument"

