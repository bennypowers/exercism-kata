module DNA (nucleotideCounts) where

import Data.Map (Map, fromList, insertWith)

tally :: Char -> Map Char Int -> Map Char Int
tally = flip (insertWith (+)) 1

allIn :: String -> String -> Bool
allIn = all . flip elem

nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts gene
  | allIn nucleotides gene = Right $ foldr tally starting gene
  | otherwise = Left ("Bad Sequence " ++ gene)
    where starting = fromList $ zip nucleotides $ repeat 0
          nucleotides = "ACGT"
