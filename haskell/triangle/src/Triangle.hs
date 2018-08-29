module Triangle (TriangleType(..), triangleType) where

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  deriving (Eq, Show)

isIllegalTriangle :: (Ord a, Num a) => a -> a -> a -> Bool
isIllegalTriangle 0 0 0 = True
isIllegalTriangle x y z =
  x > y + z ||
  y > x + z ||
  z > x + y

triangleType :: (Ord a, Eq a, Num a) => a -> a -> a -> TriangleType
triangleType a b c
  | isIllegalTriangle a b c     = Illegal
  | a == b && a == c && b == c = Equilateral
  | a /= b && a /= c && b == c = Isosceles
  | a == b && a /= c && b /= c = Isosceles
  | a /= b && a == c && b /= c = Isosceles
  | a /= b && a /= c && b /= c = Scalene
