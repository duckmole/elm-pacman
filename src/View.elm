module View exposing(..)
import Collage exposing(Form, filled, move, circle)
import Color exposing (yellow, black, white)

import Model

toGrid : Model.Model -> Model.Grid
toGrid (grid, _) =
  grid

element : Char -> Form
element char =
  case char of
    'O' ->  filled yellow (circle 10)
    '.' -> filled black (circle 4)
    _ -> filled white (circle 0)

displayElement : Int -> Int -> Char -> Form
displayElement x y char =
  move ((toFloat x),(toFloat y)) (element char)


displayEmptyGrid : Model.Grid -> List Form
displayEmptyGrid grid =
  List.concat (List.indexedMap (\index -> \line -> displayLine line index) grid)

displayLine : List Char -> Int -> List Form
displayLine line y =
  List.indexedMap (\x -> \char -> displayElement (x*50) (y*50) char) line

displayGrid : Model.Model -> List Form
displayGrid (grid, (x,y)) =
  (displayElement (x*50) (y*50) 'O') :: displayEmptyGrid grid
