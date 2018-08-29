module School (School, add, empty, grade, sorted) where

import Data.List (find, sort, sortBy)
import Data.Maybe (fromMaybe)
import Data.Function (on)
import Data.Ord (comparing)

type Student  = String
type Grade    = (Int, [Student])
type School   = [Grade]

isGrade :: Int -> Grade -> Bool
isGrade gradeNum = (==gradeNum) . fst

findGrade :: Int -> School -> Maybe Grade
findGrade x = find (isGrade x)

omitGrade :: Int -> School -> School
omitGrade gradeNum = filter (not . isGrade gradeNum)

add :: Int -> Student -> School -> School
add gradeNum student school = updated : omitted
  where
    updated = (gradeNum, sort (student:students))
    omitted = omitGrade gradeNum school
    grade = findGrade gradeNum school
    students = snd (fromMaybe (gradeNum, []) grade)

empty :: School
empty = []

grade :: Int -> School -> [Student]
grade gradeNum = maybe [] snd . findGrade gradeNum

sorted :: School -> School
sorted = sortBy (comparing fst)
