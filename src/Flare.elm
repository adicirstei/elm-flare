module Flare where

import Html exposing (..)
import Html.Attributes as Attr
import Signal


int : String -> Int -> Html
int label default =
  input
  [ Attr.type' "number"
  , Attr.value <| toString default
  ] []
