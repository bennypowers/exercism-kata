module House (rhyme) where

import Data.List.Split

villagers :: [(String, String)]
villagers =
  [ ("house", "Jack built.")
  , ("malt", "lay in")
  , ("rat", "ate")
  , ("cat", "killed")
  , ("dog", "worried")
  , ("cow with the crumpled horn", "tossed")
  , ("maiden all forlorn", "milked")
  , ("man all tattered and torn", "kissed")
  , ("priest all shaven and shorn", "married")
  , ("rooster that crowed in the morn", "woke")
  , ("farmer sowing his corn", "kept")
  , ("horse and the hound and the horn", "belonged to")
  ]

verse' :: Int -> String
verse' (-1) = "\n"
verse' n = " the " ++ who ++ that ++ did ++ verse' (n - 1)
  where
    (who, did) = villagers !! n
    that = if who == "house" then " that " else "\nthat " -- avert your eyes, children!

verse :: Int -> String
verse n = "This is" ++ verse' n

rhyme = init $ unlines $ map verse [0..11]
