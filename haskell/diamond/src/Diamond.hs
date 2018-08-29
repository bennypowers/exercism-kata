module Diamond (diamond) where

import Data.Char (toUpper)
import Data.List (elemIndex)
import Data.Maybe (fromMaybe)

fillAlphabet :: Char -> String
fillAlphabet x = ['A' .. x]

row :: Char -> String
row x = reverse list ++ tail list
  where list = fillAlphabet x

column :: Char -> String
column x = list ++ tail (reverse list)
  where list = fillAlphabet x

display :: Char -> String -> String
display x = map toggle
  where toggle y = if y == x then x else ' '

rowPair :: Char -> Char -> (Char, String)
rowPair c x = (x, row c)

diamond :: Char -> Maybe [String]
diamond x
  | c `elem` alphabet = Just $ map makeRow (column c)
  | otherwise = Nothing
    where
      alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      c = toUpper x
      makeRow = uncurry display . rowPair c
