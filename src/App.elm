module App exposing (Model, Msg, init, subscriptions, update, view)

import Effect exposing (Effect)
import Element exposing (..)
import Shared exposing (Flags)
import View exposing (View)


type alias Model =
    {}


init : Flags -> ( Model, Effect Msg )
init () =
    ( {}, Effect.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Effect.none )


view : Model -> View Msg
view _ =
    { title = "Hello, Elm!"
    , body = text "Hello, Elm!"
    }
