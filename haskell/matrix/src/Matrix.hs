module Matrix
    ( Matrix
    , cols
    , column
    , flatten
    , fromList
    , fromString
    , reshape
    , row
    , rows
    , shape
    , transpose
    ) where

import Data.List.Split
import qualified Data.Vector as Vector
import qualified Data.List as List

type Matrix a = [Vector.Vector a]

cols :: Matrix a -> Int
cols [] = 0
cols x = length . head $ x

column :: Int -> Matrix a -> Vector.Vector a
column x = Vector.fromList . map (Vector.! x)

flatten :: Matrix a -> Vector.Vector a
flatten = Vector.concat

fromList :: [[a]] -> Matrix a
fromList = map Vector.fromList

fromString :: Read a => String -> Matrix a
fromString "" = []
fromString x = deserialize x
  where
    deserializeRow = Vector.fromList . map read . splitOn " "
    deserializeCol = splitOn "\n"
    deserialize = map deserializeRow . deserializeCol

reshape :: (Int, Int) -> Matrix a -> Matrix a
reshape (x, y) =
    fromList
  . chunksOf x
  . (>>= Vector.toList)

row :: Int -> Matrix a -> Vector.Vector a
row x  = (!! x)

rows :: Matrix a -> Int
rows = length

shape :: Matrix a -> (Int, Int)
shape x = (rows x, cols x)

transpose :: Matrix a -> Matrix a
transpose [] = []
transpose matrix = transpose' matrix
  where
    transpose' =
        fromList
      . List.transpose
      . map Vector.toList
