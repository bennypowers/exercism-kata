module Acronym (abbreviate) where

import Prelude hiding (words)
import Data.List.Split
import Data.Char (isUpper, toUpper)

unless :: (a -> Bool) -> (a -> a) -> a -> a
unless p f x = if not (p x) then f x else x

words :: String -> [String]
words = wordsBy (`elem` [' ', '-'])

camelToSpace :: String -> String
camelToSpace =
    trimLeft
  . concatMap ((:) ' ')
  . split keepingCaps
  where
    keepingCaps = keepDelimsL $ oneOf ['A'..'Z']
    trimLeft = dropWhile (== ' ')

abbreviate :: String -> String
abbreviate =
    map initial
  . (>>= splitCamelCase)
  . words
  where
    splitCamelCase = words . unless (all isUpper) camelToSpace
    initial = toUpper . head
