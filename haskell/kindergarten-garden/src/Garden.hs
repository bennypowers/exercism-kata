module Garden (Plant (..), garden, lookupPlants) where

import Data.Map.Lazy (Map, findWithDefault, fromList, unionsWith)
import Data.List.Split (chunksOf)

data Plant = Clover | Grass | Radishes | Violets deriving (Eq, Show)

type Garden = Map String [Plant]

toPlant :: Char -> Plant
toPlant 'C' = Clover
toPlant 'G' = Grass
toPlant 'R' = Radishes
toPlant 'V' = Violets

garden :: [String] -> String -> Garden
garden students = unionsWith (++) . map studentRecord . lines
  where studentRecord = fromList . zip students . chunksOf 2 . map toPlant

lookupPlants :: String -> Garden -> [Plant]
lookupPlants = findWithDefault []
