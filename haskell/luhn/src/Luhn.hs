module Luhn (isValid) where

import Data.Char

digitToInteger :: Char -> Integer
digitToInteger = toInteger . digitToInt

toDigits    :: Integer -> [Integer]
toDigits x
  | x <= 0 = []
  | otherwise = (map digitToInteger . show) x

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther [] = []
doubleEveryOther [x] = [x]
doubleEveryOther (x:y:zs) = x : y * 2 : doubleEveryOther zs

listDigits :: [Integer] -> [Integer]
listDigits [] = []
listDigits xs = xs >>= toDigits

sumDigits :: [Integer] -> Integer
sumDigits = sum . listDigits

toIntegers :: String -> [Integer]
toIntegers = fmap digitToInteger . filter isDigit

luhn :: [Integer] -> Bool
luhn = (== 0) . (`mod` 10) . sumDigits . doubleEveryOther . reverse

isValid :: String -> Bool
isValid xs
  | integers == [0] = False
  | otherwise       = luhn integers
    where integers = toIntegers xs
