// airbnb is a pretty opinionated ruleset to use for a general JS course
/* eslint-disable no-prototype-builtins */
/* eslint-disable no-nested-ternary */
/* eslint-disable indent */

const tally = (acc, word) => ({
  // fold in previous
  ...acc,
  [word]:
      // edge case: [word] exists on object prototype
      acc[word] && !acc.hasOwnProperty(word) ? 1
      // edge case: two spaces
    : !word ? undefined
      // tally word
    : (acc[word] || 0) + 1,
});

const count = str =>
  str
    .toLowerCase()
    .split(/\s/)
    .reduce(tally, {});

// why classes. WHY?
export default class Words { }
Words.prototype.count = count;
