import crypto from 'crypto'
import { isAlpha, lowerAlphas, positiveNumber } from './predicates.js';

const hex = decimal =>
  ('0' + decimal.toString(16).substr(-2))

// when in browser
const randomKeyBrowser = (len = 10) =>
  [...crypto.getRandomValues(new Uint8Array(len) * 50)]
    .map(hex)
    .filter(isAlpha)
    .join('')

const randomKeyNode = (len = 10) =>
  crypto.randomBytes(len * 50)
    .toString('hex')
    .split('')
    .filter(isAlpha)
    .join('')
    .toLowerCase()

export const randomKey = (typeof process == 'object') ? randomKeyNode : randomKeyBrowser
