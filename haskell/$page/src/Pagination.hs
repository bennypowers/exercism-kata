module Pagination where

import Data.List
import Data.Maybe
import Data.List.Split

type Collection a = [a]
type ItemsPerPage = Int

itemCount :: Collection a -> Int
itemCount = length

pageCount :: Collection a -> ItemsPerPage -> Int
pageCount xs n = wholes + leftover
  where wholes = itemCount xs `div` n
        leftover = if itemCount xs `mod` n /= 0 then 1 else 0

pageItemCount :: Collection a -> ItemsPerPage -> Int -> Maybe Int
pageItemCount xs n page = if pic < 1 then Nothing else Just pic
  where c = itemCount (drop (page * n) xs)
        pic = if c > n then n else c

pageIndex :: Eq a => Collection a -> ItemsPerPage -> Int -> Maybe Int
pageIndex xs n index
  | index < 0 = Nothing
  | index > length xs = Nothing
  | otherwise = elemIndex True bs
    where
      bs = map (elem (xs!!index)) (chunksOf n xs)
