module Isogram (isIsogram) where

import           Data.Char (isAlpha, toLower)
import           Data.List (group, sort)

isIsogram :: String -> Bool
isIsogram = all (== 1) . fmap length . group . sort . normalizeString
  where normalizeString = fmap toLower . filter isAlpha
