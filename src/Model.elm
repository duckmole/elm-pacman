module Model exposing(..)

type alias Grid = List (List Char)
type alias PacMan = (Int, Int)

type alias Model = (Grid, PacMan)

defaultGrid = [ ['.', '.', '.'],
                  ['.', '.', '.'],
                  ['.', '.', '.']]
pacManPostion = (1,1)

init : Model
init =
  (defaultGrid, pacManPostion)
