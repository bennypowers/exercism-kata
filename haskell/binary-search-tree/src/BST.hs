module BST
    ( BST
    , bstLeft
    , bstRight
    , bstValue
    , empty
    , fromList
    , insert
    , singleton
    , toList
    ) where

import           Data.Maybe

data BST a = EmptyBST | Node a (BST a) (BST a) deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft EmptyBST                   = Nothing
bstLeft (Node x EmptyBST EmptyBST) = Just (Node x EmptyBST EmptyBST)
bstLeft (Node _ left _)            = Just left

bstRight :: BST a -> Maybe (BST a)
bstRight EmptyBST                   = Nothing
bstRight (Node x EmptyBST EmptyBST) = Just (Node x EmptyBST EmptyBST)
bstRight (Node _ _ right)           = Just right

bstValue :: BST a -> Maybe a
bstValue EmptyBST     = Nothing
bstValue (Node x _ _) = Just x

empty :: BST a
empty = EmptyBST

fromList :: Ord a => [a] -> BST a
fromList = foldr insert empty . reverse -- chibi foldl

insert :: Ord a => a -> BST a -> BST a
insert x EmptyBST = singleton x
insert x (Node y left right)
  | x <= y = Node y (insert x left) right
  | x > y  = Node y left (insert x right)

singleton :: a -> BST a
singleton x = Node x EmptyBST EmptyBST

toList :: BST a -> [a]
toList EmptyBST                   = []
toList (Node x EmptyBST EmptyBST) = [x]
toList (Node x left EmptyBST)     = maybeToList (bstValue left) ++ [x]
toList (Node x EmptyBST right)    = x : maybeToList (bstValue right)
toList (Node x left right)        = toList left ++ [x] ++ toList right
