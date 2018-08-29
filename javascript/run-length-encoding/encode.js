import { equals, groupWith, head, length } from 'ramda';

// group :: [Char] -> [String]
const group = groupWith(equals);

// groupLength :: [a] -> String|Number
const groupLength = grp => (
  length(grp) <= 1
    ? ''
    : length(grp)
);

// encodeGroup :: [String] -> [String, String]
const encodeGroup = grp =>
  [groupLength(grp), head(grp)]
    .join('');

// encode :: String -> String
export const encode = string =>
  group([...string])
    .map(encodeGroup)
    .join('');
