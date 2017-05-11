module Update exposing(..)

import Model exposing(..)

pressesKey: Char -> Model -> Model
pressesKey code (grid, (x, y)) =
  case code of
    '%' -> (grid, (x-1, y))
    '\'' -> (grid, (x+1, y))
    '&' -> (grid, (x, y+1))
    '(' -> (grid, (x, y-1))
    _ -> (grid, (x, y))
