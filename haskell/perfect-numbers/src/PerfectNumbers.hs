module PerfectNumbers (classify, Classification(..)) where

import Data.Numbers.Primes (isPrime)
import Control.Monad (liftM2)

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

isFactor :: Int -> Int -> Bool
isFactor x y = mod y x == 0

factors :: Int -> [Int]
factors x = [y | y <- [1..x], isFactor y x]

aliquots :: Int -> [Int]
aliquots = liftM2 filter (/=) factors

classify :: Int -> Maybe Classification
classify x
  -- edge cases
  | x == 1 = Just Deficient
  | a == 0 = Nothing
  -- normal cases
  | a == x = Just Perfect
  | a < x  = Just Deficient
  | a > x  = Just Abundant
  | otherwise = Nothing
    where a = (sum . aliquots) x
