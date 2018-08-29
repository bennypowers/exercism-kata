module Raindrops (convert) where

import Data.Set (fromList, toList)
import Data.Numbers.Primes (isPrime, primeFactors)

isFactor :: Int -> Int -> Bool
isFactor x y = mod y x == 0

factors :: Int -> [Int]
factors x = [y | y <- [1..x], isFactor y x]

unique :: Ord a => [a] -> [a]
unique = toList . fromList

plongify :: Int -> String
plongify x
  | isFactor 3 x = "Pling"
  | isFactor 5 x = "Plang"
  | isFactor 7 x = "Plong"
  | otherwise = ""

plingable :: Int -> Bool
plingable x =
  isFactor 3 x ||
  isFactor 5 x ||
  isFactor 7 x

plangerate :: Int -> String
plangerate = (plongify =<<) . unique . primeFactors

convert :: Int -> String
convert n =
  if plingable n then
    plangerate n
  else
    show n
