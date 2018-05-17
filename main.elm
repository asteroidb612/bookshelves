module Main exposing (main)

import Array
import Array
import Html exposing (program)
import Json.Decode as Decode
import List exposing (..)
import Maybe exposing (withDefault)
import Random
import String exposing (left)
import TypedSvg exposing (..)
import TypedSvg.Attributes exposing (..)
import TypedSvg.Core exposing (Svg)
import TypedSvg.Events exposing (onClick)
import TypedSvg.Core exposing (..)
import TypedSvg.Types exposing (..)


id =
    attribute "id"


path =
    node "path"


wrapper rest =
    let
        head =
            defs []
                [ linearGradient
                    [ id "Gradient" ]
                    [ stop [ id "stop10387", offset "0", TypedSvg.Attributes.style "stop-color:#5e1818;stop-opacity:1;" ] []
                    , stop [ id "stop10395", offset "0.2", TypedSvg.Attributes.style "stop-color:#b72e2e;stop-opacity:1;" ] []
                    , stop [ id "stop10393", offset "0.8", TypedSvg.Attributes.style "stop-color:#b72e2e;stop-opacity:1;" ] []
                    , stop [ id "stop10389", offset "1", TypedSvg.Attributes.style "stop-color:#641919;stop-opacity:1;" ] []
                    ]
                ]
    in
        svg
            [ height (pt 546.40173)
            , width (pt 665.39331)
            , attribute "xmlns" "http://www.w3.org/2000/svg"
            , attribute "xmlns:dc" "http://purl.org/dc/elements/1.1/"
            , attribute "xmlns:inkscape" "http://www.inkscape.org/namespaces/inkscape"
            , attribute "xmlns:sodipodi" "http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
            , attribute "xmlns:xlink" "http://www.w3.org/1999/xlink"
            , onClick ChangeShelf
            ]
            (head :: rest)


aBook : String -> Int -> Svg msg
aBook title n =
    g [ id "First", attribute "inkscape:label" "#g5490", transform [ Translate (toFloat (n * 90)) 0 ] ]
        --attribute "transform" "translate(90.093195,3.4651225)" ]
        [ path [ d "m -60.782068,8.6901697 44.661584,0 -3.08011,232.9332603 -43.121528,-0.77003 z", id "path2989", attribute "inkscape:connector-curvature" "0", attribute "style" "fill:url(#Gradient);fill-opacity:1;stroke:none" ]
            []
        , text "    "
        , node "ellipse"
            [ attribute "cx" "-39.836491", attribute "cy" "221.94022", id "path3053", attribute "rx" "8.1149206", attribute "ry" "8.8733244", attribute "style" "fill:none;stroke:#000000;stroke-width:0.72429037;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1" ]
            []
        , text "    "
        , path [ d "m -45.384355,216.97972 c 2.280262,1.09363 4.465851,2.88128 5.154397,5.41348 0.60913,2.01826 0.627604,4.20493 0.08557,6.24013 -0.08681,0.20249 -0.196084,0.39597 -0.331078,0.57038", id "path3055", attribute "inkscape:connector-curvature" "0", attribute "style" "fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" ]
            []
        , text "    "
        , path [ d "m -35.855267,215.05465 c -1.489956,1.68214 -1.845647,4.06522 -1.624168,6.23402 -0.04603,1.78399 -0.155759,3.72886 0.857346,5.29463 0.248729,0.49105 0.508083,1.05689 1.055543,1.27317", id "path3057", attribute "inkscape:connector-curvature" "0", attribute "style" "fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" ]
            []
        , text "    "
        , path [ d "m -47.116916,221.11861 c 2.221495,0.53632 4.430117,1.52392 6.76411,1.23175 1.160106,0.12672 2.499271,0.10353 3.371369,-0.78971 0.938834,-0.58428 2.203754,-0.83884 2.721875,-1.92568 0.272643,-0.3699 0.536439,-0.74624 0.81059,-1.11503", id "path3059", attribute "inkscape:connector-curvature" "0", attribute "style" "fill:none;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1" ]
            []
        , text "    "
        , node "rect"
            [ attribute "height" "5.7171612", id "rect3151", attribute "style" "fill:#f30808;fill-opacity:1;stroke:#000000;stroke-width:1.29999995;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1", width (pt 30.842159), attribute "x" "-59.506245", attribute "y" "201.80374" ]
            []
        , node "text"
            [ id "text5335", attribute "sodipodi:linespacing" "125%", attribute "style" "font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-size:13.5654068px;line-height:125%;font-family:Arial;-inkscape-font-specification:'Arial Bold';letter-spacing:0px;word-spacing:0px;fill:#e89b93;fill-opacity:1;stroke:none", attribute "transform" "matrix(-0.01039416,1.2429411,-0.80440904,-0.01606065,0,0)", attribute "x" "59.440147", attribute "xml:space" "preserve", attribute "y" "50.632797" ]
            [ node "tspan"
                [ id "tspan5337", attribute "sodipodi:role" "line", attribute "style" "font-style:normal;font-variant:normal;font-weight:bold;font-stretch:normal;font-family:'Arial Unicode MS';-inkscape-font-specification:'Arial Unicode MS Bold';fill:#e89b93;fill-opacity:1", attribute "x" "44.440147", attribute "y" "50.632797" ]
                [ text title ]
            ]
        ]


titleDecode =
    Decode.array Decode.string


bookTitles =
    case (Decode.decodeString titleDecode bookString) of
        Ok titles ->
            titles

        _ ->
            Array.fromList [ "I dunno huck finn or something?" ]


bookString =
    """[
"Kanokon",
"Kara no Kyōkai",
"Karin",
"Katekyo Hitman Reborn! Kakushi Dan 2 X- Honoo <Ikusu - Fianma>",
"Kaze no Stigma",
"Kenja no Mago",
"Kin'iro no Corda",
"Kino's Journey",
"Knight's & Magic",
"Kokoro Connect",
"KonoSuba: God's Blessing on this Wonderful World!",
"Kore wa Zombie Desu ka?",
"Kure-nai",
"Kurogane Communication",
"Kūsen Madōshi Kōhosei no Kyōkan",
"Kyo Kara Maoh!",
"Kyōran Kazoku Nikki",
"Lance N' Masques",
"Legend of the Galactic Heroes",
"The Legend of the Legendary Heroes",
"Log Horizon",
"Lost Universe",
"Loveless",
"Maburaho",
"Madan no Ō to Vanadis",
"Märchen Mädchen",
"Magical Warfare",
"Mamoru-kun ni Megami no Shukufuku o!",
"Maria-sama ga Miteru",
"Missing",
"Mondaiji-tachi ga Isekai Kara Kuru Sō Desu yo?",
"Monogatari (series)",
"Musaigen no Phantom World",
"My Youth Romantic Comedy Is Wrong, As I Expected",
"Naruto: Shiro no Dōji, Keppu no Kijin",
"Naruto: Takigakure no Shitō Orega Hero Dattebyo!",
"No Game No Life",
"No-Rin",
"Nogizaka Haruka no Himitsu",
"Noucome",
"Oniichan dakedo Ai sae Areba Kankeinai yo ne!",
"Only the Ring Finger Knows",
"Ore ga Suki nano wa Imōto dakedo Imōto ja nai",
"Ore no Imōto ga Konna ni Kawaii Wake ga Nai",
"Ore no Kanojo to Osananajimi ga Shuraba Sugiru",
"Ore, Twintail ni Narimasu.",
"Outbreak Company",
"Overlord",
"Listen to Me, Girls. I Am Your Father!",
"Petopeto-san",
"Pita Ten",
"Please Teacher! (Onegai Teacher)",
"Please Twins! (Onegai Twins)",
"A Promise of Romance",
"Psychic Detective Yakumo",
"Psycome",
"R-15",
"Rahxephon",
"Rail Wars!",
"Re:Zero − Starting Life in Another World",
"Read or Die",
"Record of Lodoss War",
"The Rising of the Shield Hero",
"Rocket Girls",
"Ro-Kyu-Bu!",
"Rokka: Braves of the Six Flowers",
"Rune Soldier",
"Rurōni Kenshinn - Meiji Kenkaku Romantic - Maki no Ichi",
"Ryūgajō Nanana no Maizōkin",
"Ryūō no Oshigoto!",
"S",
"Saga of Tanya the Evil",
"Sakura-sō no Pet na Kanojo",
"Saredo Tsumibito wa Ryū to Odoru: Dances with the Dragons",
"Scrapped Princess",
"Seiken Tsukai no World Break",
"Seitokai no Ichizon",
"Shakugan no Shana",
"Shichisei no Subaru",
"Shimoneta to Iu Gainen ga Sonzai Shinai Taikutsu na Sekai",
"Shin Honkaku Mahō Shōjo Risuka",
"Shinmai Maō no Testament",
"Shonen Onmyouji",
"Slayers",
"Sohryuden: Legend of the Dragon Kings",
"Sorcerous Stabber Orphen",
"Spice and Wolf",
"Starship Operators",
"The Story of Saiunkoku",
"Strait Jacket",
"Strawberry Panic!",
"Strike Witches",
"Strike the Blood",
"Suki na Mono wa Suki Dakara Shōganai!",
"Sunday Without God",
"Sword Art Online",
"Sword Art Online: Progressive",
"Tai-Madō Gakuen 35 Shiken Shōtai",
"Tenshi no 3P!",
"The Third",
"Toaru Hikūshi e no Koiuta",
"Toaru Hikūshi e no Tsuioku",
"Tokyo Ravens",
"Toradora!",
"Toshokan Sensō",
"Trinity Blood",
"Tsurune",
"The Twelve Kingdoms",
"Unbreakable Machine-Doll",
"Undefeated Bahamut Chronicle",
"Utsunomiko",
"Vampire Hunter D",
"Violet Evergarden",
"Watashitachi no Tamura-kun",
"The Weathering Continent",
"Welcome to the N.H.K.",
"Wicked City",
"Yoshinaga-san Chi no Gargoyle",
"Yūsha ni Narenakatta Ore wa Shibushibu Shūshoku o Ketsui Shimashita.",
"Zaregoto Series",
"Zero no Tsukaima "
]"""



------------------------


main : Program Never Bookshelf Msg
main =
    program { init = NoShelf ! [ getMeAShelf ], subscriptions = \x -> Sub.none, update = update, view = renderedShelf }


type Bookshelf
    = NoShelf
    | ShelfWithSevenRandomBooks (List Int)


type Msg
    = RandomBookShelf Bookshelf
    | ChangeShelf


update : Msg -> Bookshelf -> ( Bookshelf, Cmd Msg )
update msg shelf =
    case (msg) of
        ChangeShelf ->
            shelf ! [ getMeAShelf ]

        RandomBookShelf b ->
            b ! []


getMeAShelf : Cmd Msg
getMeAShelf =
    let
        randomBook =
            Random.int 0 121
    in
        Random.generate RandomBookShelf (Random.map ShelfWithSevenRandomBooks (Random.list 7 randomBook))


renderedShelf : Bookshelf -> Html.Html Msg
renderedShelf shelf =
    let
        nthBook n =
            aBook (left 15 (withDefault "BadArray" (Array.get n bookTitles)))
    in
        case shelf of
            NoShelf ->
                text_ [] []

            ShelfWithSevenRandomBooks books ->
                List.length books
                    |> range 1
                    |> List.map2 nthBook books
                    |> wrapper
