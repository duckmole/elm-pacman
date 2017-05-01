import Html exposing (Html)
import Model exposing (Model)
import Update exposing (pressesKey)
import View exposing (displayGrid)
import Keyboard exposing (..)
import Char exposing (..)
import Collage exposing (collage)
import Element exposing (toHtml)

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

--type alias Model = Char

init : (Model, Cmd Msg)
init =
  (Model.init, Cmd.none)

-- UPDATE

type Msg
  = Presses Char

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Presses code ->
      (Update.pressesKey code model, Cmd.none)

-- SUBSCRIPTIONS

subscriptions: Model -> Sub Msg
subscriptions model =
  Keyboard.presses (\code -> Presses (fromCode code))

-- VIEW

view : Model -> Html Msg
view model =
  toHtml (
          collage 600 600
            (displayGrid model)
         )
