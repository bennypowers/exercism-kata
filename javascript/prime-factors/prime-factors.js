import divides from './lib/divides.js';
import { isPrime } from './lib/primes.js';
import add from './lib/add.js';
import range from './lib/range.js';

const factors = n =>
  range(n)
    .map(add(1))
    // .map(x => isPrime(x) ? x : primeFactors(x))
    .filter(divides(n))
    // .flatten()

const primeFactors = n =>
  factors(n)
    .filter(isPrime);

export default class PrimeFactors {
  for(n) {
    return primeFactors(n)
  }
}
