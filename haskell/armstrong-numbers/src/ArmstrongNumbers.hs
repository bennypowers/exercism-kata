module ArmstrongNumbers (armstrong) where

import Data.Char

digitToInteger :: Char -> Integer
digitToInteger = toInteger . digitToInt

digits :: Integer -> [Integer]
digits = map digitToInteger . show

sumPowers :: Integer -> Integer -> Integer
sumPowers p = sum . map (^p) . digits

digitLen :: Integer -> Integer
digitLen = toInteger . length . show

armstrong :: Integral a => a -> Bool
armstrong x = n == sumPowers (digitLen n) n
  where n = toInteger x
