module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

data LinkedList a = EmptyLinkedList | a :> LinkedList a deriving (Eq, Show)

datum :: LinkedList a -> a
datum (x:>xs) = x

fromList :: [a] -> LinkedList a
fromList = foldr (:>) nil

isNil :: LinkedList a -> Bool
isNil EmptyLinkedList = True
isNil _ = False

new :: (Num a, Eq a) => a -> LinkedList a -> LinkedList a
new 0 _ = nil
new x linkedList = x :> linkedList

next :: LinkedList a -> LinkedList a
next (x:>EmptyLinkedList) = nil
next (x:>xs) = datum xs :> next xs

nil :: LinkedList a
nil = EmptyLinkedList

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = fromList . reverse . toList

toList :: LinkedList a -> [a]
toList EmptyLinkedList = []
toList (x:>xs) = x : toList xs
