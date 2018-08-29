module Strain (keep, discard) where

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs) = if f x then x: filter' f xs else filter' f xs

discard :: (a -> Bool) -> [a] -> [a]
discard p = filter' (not . p) 

keep :: (a -> Bool) -> [a] -> [a]
keep = filter'
