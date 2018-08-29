module ComplexNumbers
(Complex,
 conjugate,
 abs,
 real,
 imaginary,
 mul,
 add,
 sub,
 div,
 complex) where

import Prelude hiding (div, abs)

-- Data definition -------------------------------------------------------------
data Complex a = Complex { real :: a, imaginary :: a } deriving(Eq, Show)

complex :: Num a => (a, a) -> Complex a
complex (x, y) = Complex x y

-- unary operators -------------------------------------------------------------
conjugate :: Num a => Complex a -> Complex a
conjugate x = complex (real x, -imaginary x)

abs :: Floating a => Complex a -> a
abs x = sqrt (real x ** 2 + imaginary x ** 2)

-- binary operators ------------------------------------------------------------
mul :: Num a => Complex a -> Complex a -> Complex a
mul x y = complex (r, i)
  where
    r = real x * real y - imaginary x * imaginary y
    i = imaginary x * real y + real x * imaginary y

add :: Num a => Complex a -> Complex a -> Complex a
add x y = complex (r, i)
  where
    r = real x + real y
    i = imaginary x + imaginary y

sub :: Num a => Complex a -> Complex a -> Complex a
sub x y = complex (r, i)
  where
    r = real x - real y
    i = imaginary x - imaginary y

div :: Fractional a => Complex a -> Complex a -> Complex a
div x y = complex (r, i)
  where
    r = (real x * real y + imaginary x * imaginary y) / d
    i = (imaginary x * real y - real x * imaginary y) / d
    d = real y ^^ 2 + imaginary y ^^ 2
