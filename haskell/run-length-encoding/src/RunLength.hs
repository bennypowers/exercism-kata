module RunLength (encode, decode) where

import Data.List
import Data.List.Split

runLength :: String -> (Int, Char)
runLength xs = (length xs, head xs)

parseAsRunLength :: String -> (Int, Char)
parseAsRunLength [] = (0, '!')
parseAsRunLength [x] = (1, x)
parseAsRunLength xs = (read $ init xs, last xs)


encodeRunLength :: (Int, Char) -> String
encodeRunLength (1, char) = [char]
encodeRunLength (x, char) = show x ++ [char]

decodeRunLength :: (Int, Char) -> String
decodeRunLength (times, char) = replicate times char


decode :: String -> String
decode = concatMap (decodeRunLength . parseAsRunLength) . splitAfterTextChar
  where splitAfterTextChar = split (endsWithOneOf (' ' : ['A' .. 'z']))

encode :: String -> String
encode = concatMap (encodeRunLength . runLength) . group
