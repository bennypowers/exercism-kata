module ResistorColors (Color(..), value) where

import Data.Char

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Eq, Show, Enum)

value :: (Color, Color) -> Int
value (a, b) = read $ fmap (intToDigit . fromEnum) [a, b]
