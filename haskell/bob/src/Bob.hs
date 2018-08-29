module Bob (responseFor) where

import Data.Char (isUpper, isAlpha, isAlphaNum, isNumber, isSpace)
import Data.List (dropWhileEnd)
import Control.Applicative

data Response =
    ResponseQuestion
  | ResponseYell
  | ResponseYellQuestion
  | ResponseEmpty
  | ResponseDefault

instance Show Response where
  show ResponseQuestion     = "Sure."
  show ResponseYell         = "Whoa, chill out!"
  show ResponseYellQuestion = "Calm down, I know what I'm doing!"
  show ResponseEmpty        = "Fine. Be that way!"
  show ResponseDefault      = "Whatever."

liftAnd, liftOr :: (a -> Bool) -> (a -> Bool) -> a -> Bool
liftAnd = liftA2 (&&)
liftOr = liftA2 (||)

strip' :: String -> String
strip' = dropWhileEnd isSpace . dropWhile isSpace

isQuestion, isYell, isYellQuestion, isEmpty, isEmptyString :: String -> Bool
isEmpty = liftOr isEmptyString (all isSpace)
isEmptyString = (""==)
isQuestion = (=='?') . last
isYell = liftAnd (all isUpper) (any isAlpha) . filter isAlpha
isYellQuestion = liftAnd isQuestion isYell

getResponse :: String -> Response
getResponse xs
  | isEmpty xs        = ResponseEmpty
  | isYellQuestion xs = ResponseYellQuestion
  | isQuestion xs     = ResponseQuestion
  | isYell xs         = ResponseYell
  | otherwise         = ResponseDefault

responseFor :: String -> String
responseFor = show . getResponse . strip'
