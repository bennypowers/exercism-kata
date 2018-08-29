module Squares (difference, squareOfSums, sumOfSquares) where

difference :: Integral a => a -> a
difference n = squareOfSums n - sumOfSquares n

squareOfSums :: Integral a => a -> a
squareOfSums n = sum [0..n] ^ 2

sumOfSquares :: Integral a => a -> a
sumOfSquares n = sum [x^2 | x <- [0..n]]
