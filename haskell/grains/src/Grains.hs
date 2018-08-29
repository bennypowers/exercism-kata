module Grains (square, total) where

import Data.Maybe

square :: Integer -> Maybe Integer
square n
  | n > 64 = Nothing
  | n <= 0 = Nothing
  | otherwise = Just (2 ^ (n - 1))

total :: Integer
total = sum $ mapMaybe square [1 .. 64]
