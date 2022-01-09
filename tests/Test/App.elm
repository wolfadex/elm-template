module Test.App exposing (..)

import App
import Test exposing (Test)
import Test.Element.Query as Query
import Test.Html.Selector as Html


suite : Test
suite =
    Test.describe "Hello World"
        [ Test.test "renders and runs the main view" <|
            \_ ->
                App.view {}
                    |> .body
                    |> Query.fromElement
                    |> Query.has [ Html.text "Hello, Elm!" ]
        ]
