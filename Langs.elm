module Langs exposing (Model, Msg, view, update)

import Html exposing (..)
import Html.Events exposing (..)
import List


type alias Model =
  { items : List String, db : List String }



update : Msg -> Model -> Model
update msg model =
  let
    length =
      List.length model.items
  in
    case msg of
      Add ->
        { model | items = appendLang length model }

      Remove ->
        { model | items = removeLang length model }


type Msg
  = Add
  | Remove


appendLang length model =
  model.db
    |> List.drop length
    |> List.take 1
    |> List.append model.items


removeLang length model =
  model.items
    |> List.take (length - 1)


view model =
  div
    []
    [ ul [] (List.map languageItem model.items)
    , button [ onClick Add ] [ text "Add" ]
    , button [ onClick Remove ] [ text "Remove" ]
    ]


languageItem language =
  li [] [ text language ]
