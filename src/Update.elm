module Update exposing(..)

import Model exposing(..)

pressesKey: Char -> Model -> Model
pressesKey code (grid, pacman) =
  ([[code]], pacman)
