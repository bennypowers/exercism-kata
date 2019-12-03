module Date (
  Year,
  Month,
  DayOfMonth,
  WeekNumber,
  getCalendar,
  getDate,
  getFirstAndLastWeeks,
  getFirstWeek,
  getLastWeek,
  getMonth,
  getWeek,
  getWeekdays,
  getWeekNumber,
  getWeekNumbers,
  getWeeks,
  getYear,
  isFirst,
  isLast,
) where

import           Weekday

import           Data.Time.Calendar             (Day, fromGregorian,
                                                 gregorianMonthLength,
                                                 toGregorian)

import           Data.Time.Calendar.OrdinalDate (mondayStartWeek)

type Year = Integer
type Month = Int
type DayOfMonth = Int
type WeekNumber = Int

getDate :: Day -> Int
getDate = (\(_,_,d) -> d) . toGregorian

getMonth :: Day -> Int
getMonth = (\(_,m,_) -> m) . toGregorian

getYear :: Day -> Integer
getYear = (\(y,_,_) -> y) . toGregorian

getWeeks :: Day -> [Int]
getWeeks day = getWeekNumbers year month
  where
    year = getYear day
    month = getMonth day

getWeek :: Day -> Int
getWeek day = weekNumber - firstWeek - 1
  where
    weeks = getWeeks day
    weekNumber = getWeekNumber day
    firstWeek = head weeks
    lastWeek = last weeks

getWeekNumber :: Day -> Int
getWeekNumber = fst . mondayStartWeek

getWeekNumbers :: Year -> Month -> [Int]
getWeekNumbers year month = map getWeekNumber (getCalendar year month)

getCalendar :: Year -> Month -> [Day]
getCalendar year month = map (fromGregorian year month) [1..(gregorianMonthLength year month)]

getFirstWeek :: Day -> Int
getFirstWeek = head . getWeeks

getLastWeek :: Day -> Int
getLastWeek = last . getWeeks

getFirstAndLastWeeks :: Day -> (Int, Int)
getFirstAndLastWeeks day = (getFirstWeek day, getLastWeek day)

getWeekdays :: Weekday -> Year -> Month -> [Day]
getWeekdays weekday year month = filter (isWeekday weekday) (getCalendar year month)

isFirst :: Day -> Bool
isFirst d = getWeekNumber d == fst (getFirstAndLastWeeks d)

isLast :: Day -> Bool
isLast d = getWeekNumber d == snd (getFirstAndLastWeeks d)
