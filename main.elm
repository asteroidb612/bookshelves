module Main exposing (main)

import Svg exposing (svg, rect)
import Svg.Attributes exposing (..)
import List exposing (range, map)

main =
    svg [ width <| toString 1000, height <| toString 1000] someRectangles


someRectangles =
    let
        rectangle iterate =
            rect [ x (toString (iterate * 50)), width (toString 50), height "100px" ] []
    in
        range 0 5
            |> map rectangle
