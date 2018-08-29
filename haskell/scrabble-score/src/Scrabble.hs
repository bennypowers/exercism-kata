module Scrabble (scoreLetter, scoreWord) where

import Data.Char (toUpper)

scoreLetter :: Char -> Integer
scoreLetter = score . toUpper
  where
    score letter
      | letter `elem` [ 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T' ] = 1
      | letter `elem` [ 'D', 'G' ] = 2
      | letter `elem` [ 'B', 'C', 'M', 'P' ] = 3
      | letter `elem` [ 'F', 'H', 'V', 'W', 'Y' ] = 4
      | letter == 'K' = 5
      | letter `elem` [ 'J', 'X' ] = 8
      | letter `elem` [ 'Q', 'Z' ] = 10
      | otherwise = 0

scoreWord :: String -> Integer
scoreWord = sum . map scoreLetter
