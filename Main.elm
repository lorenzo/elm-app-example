module Main exposing (..)

import Langs
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App exposing (beginnerProgram, map)


init =
  { frontend = { items = [], db = [ "Js", "Elm", "CofeeScript", "CSS" ] }
  , backend = { items = [], db = [ "Ruby", "Java", "PHP", ".Net" ] }
  }


type alias Model =
  { frontend : Langs.Model, backend : Langs.Model }


type Msg
  = Frontend Langs.Msg
  | Backend Langs.Msg


update msg model =
  case msg of
    Frontend frontendMsg ->
      { model | frontend = Langs.update frontendMsg model.frontend }

    Backend backendMsg ->
      { model | backend = Langs.update backendMsg model.backend }


view model =
  div
    [ style [ ( "display", "flex" ) ] ]
    [ div
        []
        [ h3 [] [ text "Frontend Languages" ]
        , map Frontend (Langs.view model.frontend)
        ]
    , div
        [ style [ ( "margin-left", "50px" ) ] ]
        [ h3 [] [ text "Backend Languages" ]
        , map Backend (Langs.view model.backend)
        ]
    ]


main =
  beginnerProgram { model = init, update = update, view = view }
