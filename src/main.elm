module Main where

import StartApp.Simple exposing (start)

import Html exposing (div, text)
import Flare

update act int = 42

view ad m =
  div []
    [ Flare.int "x" 3
    ]




main =
  start
    { model = 0
    , update = update
    , view = view
    }
