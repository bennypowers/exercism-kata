module SumOfMultiples (sumOfMultiples) where

isMultiple :: Integer -> Integer -> Bool
isMultiple x y = x `mod` y == 0

isMultipleFrom :: [Integer] -> Integer -> Bool
isMultipleFrom factors x = any (isMultiple x) factors

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit =
  sum $ filter (isMultipleFrom factors) [1 .. limit - 1]
