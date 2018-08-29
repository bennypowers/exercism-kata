module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , simulate
    , turnLeft
    , turnRight
    ) where

type Coordinates = (Integer, Integer)
data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show)

data Robot = Robot { bearing :: Bearing
                   , coordinates :: Coordinates
                   } deriving (Eq, Show)

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot = Robot

advance :: Robot -> Robot
advance (Robot North (x, y)) = Robot North (x, y + 1)
advance (Robot East  (x, y)) = Robot East  (x + 1, y)
advance (Robot South (x, y)) = Robot South (x, y - 1)
advance (Robot West  (x, y)) = Robot West  (x - 1, y)

turnLeft :: Bearing -> Bearing
turnLeft North = West
turnLeft West = South
turnLeft South = East
turnLeft East = North

turnRight :: Bearing -> Bearing
turnRight North = East
turnRight East = South
turnRight South = West
turnRight West = North

execute :: Char -> Robot -> Robot
execute 'A' r = advance r
execute 'R' (Robot b c) = Robot (turnRight b) c
execute 'L' (Robot b c) = Robot (turnLeft b) c
execute x _ = error ("Invalid Instruction: " ++ [x])

simulate :: Robot -> String -> Robot
simulate = foldl (flip execute)
