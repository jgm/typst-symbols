{- cabal:
build-depends: base, scalpel == 0.6.2, pretty-show, text
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
  fetchSymbols = chroots ("li" @: [match dataValue]) pair

  dataValue "data-value" _ = True
  dataValue _ _ = False

  dropVariationSelector t =
    case t of
      [] -> []
      _ -> case last t of
             '\65039' -> init t
             '\65038' -> init t
             _ -> t

  pair = do
    accent <- (== "true") <$> attr "data-accent" "li"
    name <- T.drop 7 . T.pack <$> attr "id" "li"
    val <- dropVariationSelector <$> attr "data-value" "li"
    pure (name, accent, T.pack val)

getShorthand :: IO (Maybe [(Text, Text)])
getShorthand =
  scrapeURLWithConfig
    Config{ decoder = utf8Decoder, manager = Nothing}
    ("https://typst.app/docs/reference/symbols/")
    fetchSymbols
 where
  fetchSymbols = chroots ("li" @: [match mathShorthand]) pair

  mathShorthand "data-math-shorthand" _ = True
  mathShorthand _ _ = False

  pair = do
    name <- T.drop 7 . T.pack <$> attr "id" "li"
    shorthand <- T.pack <$> attr "data-math-shorthand" "li"
    pure (shorthand, name)

main = do
  args <- getArgs
  case args of
    [] -> getShorthand >>= maybe (error "Got Nothing!")
                            (pPrint . filter (not . T.null . fst))
    x:_ -> do
      mbsyms <- getSymbolTable x
      case mbsyms of
        Nothing -> error "Got nothing!"
        Just syms -> pPrint syms

