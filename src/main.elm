module Main where

import Html exposing (div, text, fromElement, button)
import Graphics.Element as El
import Html.Events as Ev
--import Html.Attributes as At

import Signal

type Action
  = NoOp
  | Simple
  | Custom Int


actionMB =
  Signal.mailbox NoOp

update act model =
  case act of
    NoOp -> model
    Simple -> {model | clicks = model.clicks + 1}
    Custom step -> {model | clicks = model.clicks + step}


model =
  { clicks = 0
  }

view generalAddress customAddress model =
  div
    []
    [ fromElement <| El.show model
    , button
        [ Ev.onClick generalAddress Simple
        ]
        [ text "general mailbox address" ]
    , button
        [ Ev.onClick customAddress 6
        ]
        [ text "Custom mailbox address +6" ]
    ]

modelStream = Signal.foldp update model actionMB.signal

main =
  let
    custom = Signal.forwardTo actionMB.address Custom
    viewPartAplied = view actionMB.address custom
  in
    Signal.map viewPartAplied modelStream
