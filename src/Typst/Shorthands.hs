{-# LANGUAGE OverloadedStrings #-}
module Typst.Shorthands (
  mathSymbolShorthands
)
where
import Data.Text (Text)

-- A list of pairs of math shorthands and symbol names.
mathSymbolShorthands :: [(Text, Text)]
mathSymbolShorthands =
-- autogenerated by make update-symbols
  [ ( "[|" , "bracket.l.double" )
  , ( "|]" , "bracket.r.double" )
  , ( "||" , "bar.v.double" )
  , ( "*" , "ast.op" )
  , ( ":=" , "colon.eq" )
  , ( "::=" , "colon.double.eq" )
  , ( "..." , "dots.h" )
  , ( "~" , "tilde.op" )
  , ( "'" , "prime" )
  , ( "-" , "minus" )
  , ( "=:" , "eq.colon" )
  , ( "!=" , "eq.not" )
  , ( ">>" , "gt.double" )
  , ( ">=" , "gt.eq" )
  , ( ">>>" , "gt.triple" )
  , ( "<<" , "lt.double" )
  , ( "<=" , "lt.eq" )
  , ( "<<<" , "lt.triple" )
  , ( "*" , "convolve" )
  , ( "->" , "arrow.r" )
  , ( "|->" , "arrow.r.bar" )
  , ( "=>" , "arrow.r.double" )
  , ( "|=>" , "arrow.r.double.bar" )
  , ( "==>" , "arrow.r.double.long" )
  , ( "-->" , "arrow.r.long" )
  , ( "~~>" , "arrow.r.long.squiggly" )
  , ( "~>" , "arrow.r.squiggly" )
  , ( ">->" , "arrow.r.tail" )
  , ( "->>" , "arrow.r.twohead" )
  , ( "<-" , "arrow.l" )
  , ( "<==" , "arrow.l.double.long" )
  , ( "<--" , "arrow.l.long" )
  , ( "<~~" , "arrow.l.long.squiggly" )
  , ( "<~" , "arrow.l.squiggly" )
  , ( "<-<" , "arrow.l.tail" )
  , ( "<<-" , "arrow.l.twohead" )
  , ( "<->" , "arrow.l.r" )
  , ( "<=>" , "arrow.l.r.double" )
  , ( "<==>" , "arrow.l.r.double.long" )
  , ( "<-->" , "arrow.l.r.long" )
  ]
