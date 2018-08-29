module Hamming (distance) where

matchPair :: (Char, Char) -> Int
matchPair (a, b) = if a == b then 0 else 1

matches :: String -> String -> [Int]
matches xs ys = fmap matchPair (zip xs ys)

distance :: String -> String -> Maybe Int
distance xs ys
  | testable = Just (sum $ matches xs ys)
  | otherwise = Nothing
    where testable = length xs == length ys
