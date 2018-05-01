module Main exposing (main)

import String exposing (left)
import Hacks exposing (wrapper, aBook, bookTitles)
import List exposing (head)
import Maybe exposing (withDefault)
import Array

main = wrapper [ aBook (left 15 "A man, a Plan, a Canal, Panama") 2
               , aBook (left 15 "Something Completely Different") 1
               , aBook (left 15 (withDefault "Bad Array" ( Array.get 1 bookTitles ))) 3
               , aBook (left 15 (withDefault "Bad Array" ( Array.get 2 bookTitles ))) 4
               ]
