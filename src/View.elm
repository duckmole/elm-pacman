module View exposing(..)
import Collage exposing(Form, filled, move, circle)
import Color exposing (purple)

import Model

toGrid : Model.Model -> Model.Grid
toGrid (grid, _) =
  grid

element : Char -> Form
element char =
  filled purple (circle 10)

displayElement : Int -> Int -> Char -> Form
displayElement x y char =
  move ((toFloat x),(toFloat y)) (element char)

displayGrid : Model.Model -> List Form
displayGrid model =
  [displayElement 50 50 '.',
     displayElement 150 50 '.'
     ]
