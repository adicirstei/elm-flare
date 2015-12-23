module Main where

import Html exposing (div, text, fromElement)
import Graphics.Element as El
import Html.Events as Ev

import Signal

type Action
  = NoOp
  | Buuuu


actionMB =
  Signal.mailbox NoOp


update act model =
  case act of
    NoOp -> model
    Buuuu -> {model | clicks = model.clicks + 1}

model =
  { clicks = 0
  }

view address model =
  div
    [ Ev.onClick address Buuuu ]
    [ fromElement <| El.show model ]

modelStream = Signal.foldp update model actionMB.signal

main = Signal.map (view actionMB.address) modelStream
