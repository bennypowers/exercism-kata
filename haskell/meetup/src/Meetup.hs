module Meetup (Weekday(..), Schedule(..), meetupDay) where

import           Data.Time.Calendar (Day)
import           Date               (Month, Year, getCalendar, getDate, getWeek,
                                     getWeekNumber, getWeekdays)
import           Weekday

data Schedule = First
              | Second
              | Third
              | Fourth
              | Last
              | Teenth
              deriving (Eq, Enum)

isSchedule :: Schedule -> Day -> Bool
isSchedule schedule d = getWeek d == fromEnum schedule

isTeenth :: Day -> Bool
isTeenth d = date > 12 && date < 20
  where date = getDate d

getLast :: Weekday -> Year -> Month -> Day
getLast weekday year month = last $ getWeekdays weekday year month

getTeenth :: Weekday -> Year -> Month -> Day
getTeenth weekday year month = head $ filter isTeenth $ getWeekdays weekday year month

getScheduledDay :: Schedule -> Weekday -> Year -> Month -> Day
getScheduledDay Last weekday year month = last $ getWeekdays weekday year month
getScheduledDay Teenth weekday year month = head $ filter (isSchedule Teenth) $ getWeekdays weekday year month
getScheduledDay schedule weekday year month = getWeekdays weekday year month !! fromEnum schedule

meetupDay :: Schedule -> Weekday -> Year -> Month -> Day
meetupDay Last weekday year month = getLast weekday year month
meetupDay Teenth weekday year month = getTeenth weekday year month
meetupDay schedule weekday year month = getScheduledDay schedule weekday year month
