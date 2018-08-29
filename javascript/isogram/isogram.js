import { groupWith, equals } from 'ramda'
import { compose, mreduceMap, All } from 'crocks'

// isAlpha, isSingle :: a -> Bool
const isAlpha = c => c.match(/[A-z]/)
const isSingle = x => x.length === 1

// it's almost like magic, but it's just math :D
// allSingle :: [a] -> Bool
const allSingle = mreduceMap(All, isSingle)

// groupSame :: [a] -> [[a]]
const groupSame = groupWith(equals)

// sortString :: String -> [Char]
const sortString = str =>
  [...str.toUpperCase()]
    .filter(isAlpha)
    .sort()

// groupNormalLetters :: String -> [[a]]
const groupNormalLetters =
  compose(groupSame, sortString)

// isIsogram :: String -> Bool
const isIsogram =
  compose(allSingle, groupNormalLetters)

// using a class for a simple predicate is abuse
export default class Isogram {
  constructor(string) { this.string = string }
  isIsogram() { return isIsogram(this.string) }
}
