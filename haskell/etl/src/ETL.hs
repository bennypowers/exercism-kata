module ETL (transform) where

import Data.Map (Map, toList, fromList)
import Data.Char (toLower)

fromOld :: (a, String) -> [(Char, a)]
fromOld (score, letters) = map newify letters
  where newify l = (toLower l, score)

transform :: Map a String -> Map Char a
transform = fromList . (fromOld =<<) . toList
