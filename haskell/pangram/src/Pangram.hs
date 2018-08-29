module Pangram (isPangram) where

import Data.Set (fromList, isSubsetOf)
import Data.Char (toUpper)

uppercase :: String -> String
uppercase = map toUpper

belongsTo :: Ord a => [a] -> [a] -> Bool
belongsTo xs = isSubsetOf (fromList xs) . fromList

isPangram :: String -> Bool
isPangram = belongsTo "ABCDEFGHIJKLMNOPQRSTUVWXYZ" . uppercase
