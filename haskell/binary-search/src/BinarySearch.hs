module BinarySearch (find) where

import           Data.Array

findInRange :: (Show a, Ord a) => (Int, Int) -> Array Int a -> a -> Maybe Int
findInRange (lower, upper) arr x
  | null arr         = Nothing
  | x == arr ! upper = Just upper
  | x == arr ! lower = Just lower
  | x == arr ! pivot = Just pivot
  | lower == pivot   = Nothing
  | upper == pivot   = Nothing
  | x <  arr ! pivot = findInRange (lower, pivot - 1) arr x
  | x >  arr ! pivot = findInRange (pivot, upper) arr x
  | otherwise        = Nothing
  where pivot = lower + ((upper - lower) `div` 2)

find :: (Show a, Ord a) => Array Int a -> a -> Maybe Int
find arr = findInRange (bounds arr) arr
