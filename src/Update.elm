module Update exposing(..)

import Model exposing(..)

pressesKey: Char -> Model -> Model
pressesKey code (grid, (x, y)) =
  case code of
    '%' -> (move grid (x-1, y))
    '\'' -> (move grid (x+1, y))
    '&' -> (move grid (x, y+1))
    '(' -> (move grid (x, y-1))
    _ -> (grid, (x, y))

move: Grid -> PacMan -> Model
move grid pacMan =
  let
     updatedGrid = List.indexedMap (\index -> \line -> updateLine index line pacMan) grid
  in
     (updatedGrid, pacMan)

updateLine: Int -> List Char -> PacMan -> List Char
updateLine y line pacMan =
  List.indexedMap (\x -> \char -> updatePosition x y pacMan char) line

updatePosition: Int -> Int -> (Int, Int) -> Char -> Char
updatePosition x y (pacManX, pacManY) char =
  if char == 'O' then
    ' '
  else if x == pacManX && y == pacManY then
    'O'
    else
      char
