module Boxes.List exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class)
import Boxes.Messages exposing (..)
import Boxes.Models exposing (Box)


view : List Box -> Html Msg
view boxes =
    div []
        [ nav boxes
        , list boxes
        ]


nav : List Box -> Html Msg
nav boxes =
    div []
        [ div [ class "page-title" ] [ text "Boxes" ] ]


list : List Box -> Html Msg
list boxes =
    div []
        [ table []
            [ thead []
                [ tr []
                    [ th [] [ text "Id" ]
                    , th [] [ text "Name" ]
                    , th [] [ text "Description" ]
                    , th [] [ text "Order" ]
                    , th [] [ text "User ID" ]
                    , th [] [ text "Actions" ]
                    ]
                ]
            , tbody [] (List.map boxRow boxes)
            ]
        ]


boxRow : Box -> Html Msg
boxRow box =
    tr []
        [ td [] [ text (toString box.id) ]
        , td [] [ text box.name ]
        , td [] [ text box.desc ]
        , td [] [ text (toString box.order) ]
        , td [] [ text (toString box.userId) ]
        , td []
            [ editBtn box ]
        ]

editBtn : Box -> Html.Html Msg
editBtn box =
    button
        [ class "btn regular"
        , onClick (ShowBox box.id)
        ]
        [ i [ class "fa fa-pencil mr1" ] [], text "Edit" ]
