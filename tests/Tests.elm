module Tests exposing (..)

import Test exposing (..)
import Expect
import Model
import View exposing (..)
import Collage exposing(..)
import Color exposing(..)
import Update


all : Test
all =
    describe "PacMan"
        [ describe "Model"
            [ test "Initialisation" <|
                \() ->
                    Expect.equal Model.init ([['.', '.', '.'], ['.', '.', '.'], ['.', '.', '.']], (1,1))
            ]
          , describe "View"
            [ test "Display pacman on grid" <|
                \() ->
                  Expect.equal [['.', '.', '.'], ['.', 'V', '.'], ['.', '.', '.']] (View.toGrid Model.init)
              , test "Display canvas grid" <|
                \() ->
                  let
                    purpleCircle =  filled purple (circle 10)
                    expected = [move(50, 50) purpleCircle,
                                  move(150, 50) purpleCircle,
                                  move(50, 150) purpleCircle,
                                  move(150, 150) purpleCircle
                               ]
                  in
                    Expect.equal expected (displayGrid ([['.', '.'], ['.', '.']], (1,1)))
            ]
          , describe "Update"
            [ test "Update when press -> key " <|
                \() ->
                    let
                      (_, position) = (Update.pressesKey '%' Model.init)
                    in
                      Expect.equal (0,1) position
            ]
        ]
