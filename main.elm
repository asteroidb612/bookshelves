module Main exposing (main)

import String exposing (left)
import Hacks exposing (aBook, bookTitles)


main =
    aBook <| left 15 "A man, a Plan, a Canal, Panama"
