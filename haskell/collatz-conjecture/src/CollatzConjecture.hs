module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n < 1    = Nothing
  | n == 1    = Just 0
  | even n    = (+1) <$> collatz (n `quot` 2)
  | otherwise = (+1) <$> collatz (3 * n + 1)
