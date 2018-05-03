module Main exposing (main)

import String exposing (left)
import Hacks exposing (wrapper, aBook, bookTitles)
import Maybe exposing (withDefault)
import Array
import List exposing (..)
import TypedSvg.Core exposing (Svg)


nthBook : Int -> Svg msg
nthBook n =
    aBook (left 15 (withDefault "BadArray" (Array.get n bookTitles))) n


nBooks : Int -> List (Svg msg)
nBooks n =
    map nthBook (range 0 n)


main : Svg msg
main =
    wrapper (nBooks 17)
