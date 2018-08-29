import { fromNullable, set, truthyEither } from './lib/types.js';
import { all, filter, toLowerCase } from './lib/utilities.js';
import { letter } from './lib/predicates.js';

// Set s, Num t, Bool b :: t -> s -> b
const size = t => s => s.size === t;

// Set s, Bool b :: a -> s -> b
const has = m => s => s.has(m);

// Composed pangram gate
// Set a, Bool b :: a -> b
const muhPangram = all(has('a'), has('z'), size(26));

// Str s, Bool b :: s -> b
const pangram = s => fromNullable(s)
  .map(toLowerCase)
  // filter the inner value by the function `letters`
  .map(filter(letter))
  // JS built-in Set does most of the work for us. 🍻
  .map(set)
  // Test the results 👨‍🔬🔬
  .chain(truthyEither(muhPangram))
  // smoke 'em if you got 'em. 🐸
  .fold(() => false, () => true);

// Package pangram up for the tester. 📦
export default class Pangram {
  constructor(candidate) {
    this.candidate = candidate;
  }

  isPangram() {
    return pangram(this.candidate);
  }
}