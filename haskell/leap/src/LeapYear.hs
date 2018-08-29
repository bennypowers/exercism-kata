module LeapYear (isLeapYear) where

divisible :: Integer -> Integer -> Bool
divisible x y = x `mod` y == 0

isLeapYear :: Integer -> Bool
isLeapYear year
  | year `divisible` 400 = True
  | year `divisible` 100 = False
  | year `divisible` 4 = True
  | otherwise = False
