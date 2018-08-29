import { truthyEither, fromNullable } from './lib/types.js';
import { add, id, modulo, fromCharCode, toCharCode, subtract } from './lib/utilities.js';
import { lowerAlphas, positiveNumber } from './lib/predicates.js';
import { impureLogError } from './lib/impure.js';
import { randomKey } from './lib/crypto.js'

// toCharCode('a') === 97
// toCharCode('z') === 122

const normalizeChar = subtract(97);
const deNormalizeChar = add(97);
const wrapNormalizedChar = modulo(26);

const wrap = c => fromNullable(c)
  // handle shifted -1 edge case: wrap around the ASCII table
  .chain(truthyEither(positiveNumber))
  .map(add(104)) // NOTE: Magic num: ASCII distance from 'a' to 'A'
  .map(wrapNormalizedChar)
  .fold(wrapNormalizedChar, wrapNormalizedChar);

const shiftChar = (shiftFn, k, x) => fromNullable(x)
  .map(normalizeChar)
  .map(shiftFn(normalizeChar(k)))
  .map(wrap)
  .map(deNormalizeChar)
  .fold(impureLogError, id);

const shiftByKey = (shiftFn, key) => (c, i) =>
  shiftChar(shiftFn, key.charCodeAt(i % key.length), c);

const cipher = shiftFn => key => text => Array.from(text)
  .map(toCharCode)
  .map(shiftByKey(shiftFn, key))
  .map(fromCharCode)
  .join('');

const encode = cipher(add);

const decode = cipher(subtract);

// Package up cipher for the tester
export default class Cipher {
  constructor(key = randomKey(10)) {
    if (!lowerAlphas(key)) throw new Error('Bad key');
    this.key = key;
  }

  encode(text) {
    return encode(this.key)(text);
  }

  decode(ctext) {
    return decode(this.key)(ctext);
  }

}
