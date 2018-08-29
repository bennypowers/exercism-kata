module SpaceAge (Planet(..), ageOn) where

type Coefficient = Float
data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

years :: Float -> Float
years seconds = seconds / 60 / 60 / 24 / 365.25

calculateAge :: Coefficient -> Float -> Float
calculateAge c s = years (s / c)

lookupCoefficient :: Planet -> Coefficient
lookupCoefficient Mercury = 0.2408467
lookupCoefficient Venus   = 0.61519726
lookupCoefficient Earth   = 1.0
lookupCoefficient Mars    = 1.8808158
lookupCoefficient Jupiter = 11.862615
lookupCoefficient Saturn  = 29.447498
lookupCoefficient Uranus  = 84.016846
lookupCoefficient Neptune = 164.79132
lookupCoefficient x = error "Doors and Corners"

ageOn :: Planet -> Float -> Float
ageOn = calculateAge . lookupCoefficient
