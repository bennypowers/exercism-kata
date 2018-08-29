module Phone (number) where

import Data.Char (isNumber)

numerals :: String -> String
numerals = filter isNumber

lastN :: Int -> [a] -> [a]
lastN n xs = drop (length xs - n) xs

last10 :: String -> String
last10 = lastN 10

isNLong :: Int -> String -> Bool
isNLong n = (==n) . length

and' :: (a -> Bool) -> (a -> Bool) -> (a -> Bool)
and' f g = (&&) <$> f <*> g

not01 :: Char -> Bool
not01 = and' (/='0') (/='1')

validatePosition :: Int -> String -> Bool
validatePosition n = not01 . (!! n) . last10

validAreaCode, validCountryCode, validExchange, is10Long, is11Long, isValidNANP, startsWith1 :: String -> Bool
validAreaCode = validatePosition 0
validCountryCode = and' is11Long startsWith1
validExchange = validatePosition 3
is10Long = isNLong 10
is11Long = isNLong 11
startsWith1 = (=='1') . head
isValidNANP xs =
  validExchange xs &&
  validAreaCode xs &&
  (is10Long xs || validCountryCode xs)

validate :: String -> Maybe String
validate ys = if isValidNANP ys then Just (last10 ys) else Nothing

number :: String -> Maybe String
number = validate . numerals
