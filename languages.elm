module Main exposing (..)

import Html exposing (..)
import Html.App exposing (beginnerProgram)
import Html.Events exposing (..)
import List


main =
  beginnerProgram { model = [], view = view, update = update }


type Msg
  = Add
  | Remove


view langs =
  div
    []
    [ ul [] (List.map languageItem langs)
    , button [ onClick Add ] [ text "Add" ]
    , button [ onClick Remove ] [ text "Remove" ]
    ]


languages =
  [ "Javascript", "Elixir", "Elm", "PHP", "Ruby" ]


update msg langs =
  let
    length =
      List.length langs
  in
    case msg of
      Add ->
        languages
          |> List.drop length
          |> List.take 1
          |> List.append langs

      Remove ->
        langs
          |> List.take (length - 1)


languageItem language =
  li [] [ text language ]
