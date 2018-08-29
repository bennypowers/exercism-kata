module Accumulate (accumulate) where

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

accumulate :: (a -> b) -> [a] -> [b]
accumulate = map'
