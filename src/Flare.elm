module Flare (int) where

import Html exposing (..)
import Html.Attributes as Attr
import Signal


onInput : Signal.Address a -> (String -> a) -> Attribute
onInput address contentToValue =
    on "input" targetValue (\str -> Signal.message address (contentToValue str))

toInt : String -> Int
toInt s = 42

int : String -> Int -> Signal Html
int lbl default =
  div
    [ Attr.class "flare-input" ]
    [
      label
        [ Attr.for lbl ]
        [ text lbl ]
    , input
        [ Attr.type' "number"
        , Attr.value <| toString default
        , Attr.id lbl
        , onInput 
        ] []
    ]
