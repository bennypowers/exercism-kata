module IsbnVerifier (isbn) where

import Data.Char (digitToInt, isNumber)
import Control.Applicative

toInteger' :: Char -> Int
toInteger' x =
  if x == 'X' then
    10
  else
    digitToInt x

isValidChecksum :: Char -> Bool
isValidChecksum = liftA2 (||) (=='X') isNumber

allNumbers, hasValidBody, hasValidChars, hasValidChecksum, length10 :: String -> Bool
allNumbers = all isNumber . init
hasValidBody = liftA2 (&&) length10 allNumbers
hasValidChars = liftA2 (&&) hasValidBody hasValidChecksum
hasValidChecksum = isValidChecksum . last
length10 = (==10) . length

isbn, isbnAlgorithm, validateIsbn :: String -> Bool
validateIsbn = liftA2 (&&) hasValidChars isbnAlgorithm
isbn = validateIsbn . filter (/='-')
isbnAlgorithm =
    (==0)
  . flip mod 11
  . sum
  . zipWith (*) [10, 9..1]
  . map toInteger'
