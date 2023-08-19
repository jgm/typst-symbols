{-# LANGUAGE OverloadedStrings #-}
module Typst.Shorthands (
  typstShorthands
)
where
import Data.Text (Text)

-- A list of pairs of shorthands and symbol names.
typstShorthands :: [(Text, Text)]
typstShorthands =
-- autogenerated by make update-symbols
  [ ( "->" , "arrow.r" )
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
  , ( "*" , "ast.op" )
  , ( "||" , "bar.v.double" )
  , ( "[|" , "bracket.l.double" )
  , ( "|]" , "bracket.r.double" )
  , ( ":=" , "colon.eq" )
  , ( "::=" , "colon.double.eq" )
  , ( "*" , "convolve" )
  , ( "..." , "dots.h" )
  , ( "=:" , "eq.colon" )
  , ( "!=" , "eq.not" )
  , ( ">>" , "gt.double" )
  , ( ">=" , "gt.eq" )
  , ( ">>>" , "gt.triple" )
  , ( "<<" , "lt.double" )
  , ( "<=" , "lt.eq" )
  , ( "<<<" , "lt.triple" )
  , ( "-" , "minus" )
  , ( "'" , "prime" )
  ]