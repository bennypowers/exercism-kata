module Beer (song) where

import Data.Char (toUpper)

howManyBottles :: Integer -> String
howManyBottles 0 = "no more bottles of beer"
howManyBottles 1 = "1 bottle of beer"
howManyBottles x = show x ++ " bottles of beer"

takeOneDown :: Integer -> String
takeOneDown 0 = "Go to the store and buy some more, "
takeOneDown 1 = "Take it down and pass it around, "
takeOneDown _ = "Take one down and pass it around, "

capitalize :: String -> String
capitalize "" = ""
capitalize (x:xs) = toUpper x : xs

prefix :: Integer -> String
prefix i = howManyBottles i
        ++ " on the wall, "
        ++ howManyBottles i
        ++ ".\n"
        ++ takeOneDown i

suffix :: Integer -> String
suffix 0 = howManyBottles 99 ++ " on the wall.\n"
suffix i = howManyBottles (i - 1) ++ " on the wall.\n\n"

verse :: Integer -> String
verse i = capitalize $ prefix i ++ suffix i

song :: String
song = concatMap verse [99, 98 .. 0]
