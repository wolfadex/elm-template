module App exposing (Model, Msg, init, subscriptions, update, view)

import Effect exposing (Effect)
import Element exposing (..)
import Element.Input as Input
import Shared exposing (Flags)
import View exposing (View)


type alias Model =
    Int



---- INIT ----


init : Flags -> ( Model, Effect Msg )
init () =
    ( 0, Effect.none )



---- UPDATE ----


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Effect.none )

        Decrement ->
            ( model - 1, Effect.none )



---- VIEW ----


view : Model -> View Msg
view _ =
    { title = "Hello, Elm!"
    , body =
        column
            []
            [ text "Hello, Elm!"
            , Input.button
                []
                { label = text "Increment"
                , onPress = Just Increment
                }
            , Input.button
                []
                { label = text "Decrement"
                , onPress = Just Decrement
                }
            ]
    }
