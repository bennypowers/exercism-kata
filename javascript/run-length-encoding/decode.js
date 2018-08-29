import { compose, groupWith, last, repeat } from 'ramda';

// isDigit :: String -> Bool
const isDigit = x => x.toString().match(/[0-9]/);

// lastIsDigit :: [String] -> Bool
const lastIsDigit = compose(isDigit, last);

// digitGrouper :: (a, b) -> Bool
const digitGrouper = (a, b) =>
  isDigit(a) &&
  isDigit(b);

// alphaGrouper :: (a, b) -> Bool
const alphaGrouper = (a, b) =>
  lastIsDigit(a) &&
  !isDigit(b);

const pass1 = groupWith(digitGrouper);
const pass2 = groupWith(alphaGrouper);

// Resorting to two passes due to quirks in R.groupWith
// degroup :: [a] -> [[a]]
const degroup = compose(pass2, pass1);

// normalize :: ([String] | [[String], [String]]) -> [Number, String]
const normalize = ([times, char]) => (
  !char
    ? [1, last(times)]
    : [Number(times.join('')), last(char)]
);

// degroupChar :: [Number, String] -> String
const degroupChar = ([times, char]) =>
  repeat(char, times)
    .join('');

// decode :: String -> String
export const decode = string =>
  degroup([...string])
    .map(normalize)
    .map(degroupChar)
    .join('');
