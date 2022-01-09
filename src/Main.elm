module Main exposing (init, main, subscriptions, update, view)

import App
import Browser exposing (Document)
import Effect
import Element exposing (..)
import Shared exposing (Flags)
import View exposing (View)


main : Program Flags App.Model Msg
main =
    Browser.document
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


init : Flags -> ( App.Model, Cmd Msg )
init flags =
    Tuple.mapSecond (Effect.toCmd AppMessage) (App.init flags)


subscriptions : App.Model -> Sub Msg
subscriptions _ =
    Sub.none


type Msg
    = AppMessage App.Msg


update : Msg -> App.Model -> ( App.Model, Cmd Msg )
update msg model =
    case msg of
        AppMessage message ->
            Tuple.mapSecond
                (Effect.toCmd AppMessage)
                (App.update message model)


view : App.Model -> Document Msg
view model =
    let
        content : View App.Msg
        content =
            App.view model
    in
    { title = content.title
    , body =
        [ layout [ width fill, height fill ]
            (map AppMessage content.body)
        ]
    }
