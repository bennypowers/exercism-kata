module Anagram (anagramsFor) where

import Data.List (sort)
import Data.Char (toLower)

isAnagram :: String -> String -> Bool
isAnagram x y =
     x_        /= y_
  && length x_ == length y_
  && sort x_   == sort y_
  where
    x_ = map toLower x
    y_ = map toLower y

anagramsFor :: String -> [String] -> [String]
anagramsFor xs = filter (isAnagram xs)
