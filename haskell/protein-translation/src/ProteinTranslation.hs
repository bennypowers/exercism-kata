module ProteinTranslation(proteins) where

import Data.List.Split (chunksOf)

type Codon = String
type Protein = String

codons :: String -> [Codon]
codons = takeWhile (not . (`elem` stops)) . chunksOf 3
  where stops = ["UAA", "UAG", "UGA"]

protein :: Codon -> Maybe Protein
protein codon
  | codon == "AUG" = Just "Methionine"
  | codon == "UGG" = Just "Tryptophan"
  | codon `elem` ["UUU", "UUC"] = Just "Phenylalanine"
  | codon `elem` ["UUA", "UUG"] = Just "Leucine"
  | codon `elem` ["UAU", "UAC"] = Just "Tyrosine"
  | codon `elem` ["UGU", "UGC"] = Just "Cysteine"
  | codon `elem` ["UCU", "UCC", "UCA", "UCG"] = Just "Serine"
  | otherwise = Nothing

proteins :: String -> Maybe [Protein]
proteins = traverse protein . codons
