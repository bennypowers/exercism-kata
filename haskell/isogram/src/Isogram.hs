module Isogram (isIsogram) where

import Data.List (elemIndex, isInfixOf)
import Data.Char (isAlpha, toLower)
import Data.Maybe (fromMaybe)

lowercase :: String -> String
lowercase = map toLower

alphas :: String -> String
alphas = filter isAlpha

charOnce :: Char -> String -> Bool
charOnce x xs = not $ isInfixOf [x] (isolate x xs)

isolate :: Char -> String -> String
isolate x xs = pref ++ suff
  where
    i = elemIndex x xs
    suff = drop (fromMaybe (-1) i + 1) xs
    pref = take (fromMaybe (-1) i) xs

isIsogram :: String -> Bool
isIsogram string = all isUnique filtered
  where
    filtered = alphas . lowercase $ string
    isUnique = (`charOnce` filtered)
