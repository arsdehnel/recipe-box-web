module View exposing (..)

import Html exposing (Html, div, text)
import Html.App
import Messages exposing (Msg(..))
import Models exposing (Model)
import Players.List
import Players.Edit
import Players.Models exposing (PlayerId)
import Boxes.List
import Boxes.Edit
import Boxes.Models exposing (BoxId)
import Routing exposing (Route(..))


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        PlayersRoute ->
            Html.App.map PlayersMsg (Players.List.view model.players)

        PlayerRoute id ->
            playerEditPage model id

        BoxesRoute ->
            Html.App.map BoxesMsg (Boxes.List.view model.boxes)

        BoxRoute id ->
            boxEditPage model id

        NotFoundRoute ->
            notFoundView


playerEditPage : Model -> PlayerId -> Html Msg
playerEditPage model playerId =
    let
        maybePlayer =
            model.players
                |> List.filter (\player -> player.id == playerId)
                |> List.head
    in
        case maybePlayer of
            Just player ->
                Html.App.map PlayersMsg (Players.Edit.view player)

            Nothing ->
                notFoundView

boxEditPage : Model -> BoxId -> Html Msg
boxEditPage model boxId =
    let
        maybeBox =
            model.boxes
                |> List.filter (\box -> box.id == boxId)
                |> List.head
    in
        case maybeBox of
            Just box ->
                Html.App.map BoxesMsg (Boxes.Edit.view box)

            Nothing ->
                notFoundView

notFoundView : Html msg
notFoundView =
    div []
        [ text "Not found"
        ]