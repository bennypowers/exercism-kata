import range from './range.js';
import add from './add.js';

export const isPrime = n => (
    n === 1 ? false
  : range(n)
      .map(add(1))
      .every(x => x === 1 || x === n || n % x !== 0)
);

export const primesTo = (limit) =>
  range(limit)
    .filter(isPrime)
