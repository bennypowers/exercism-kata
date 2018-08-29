import { notNull } from './predicates.js';

// Types

/* eslint-disable no-unused-vars */

export const Right = x => ({
  x,
  fold: (f, g) => g(x),
  map: f => Right(f(x)),
  chain: f => f(x),
  inspect: _ => `Right(${x})`,
});

export const Left = x => ({
  x,
  fold: (f, g) => f(x),
  map: _ => Left(x),
  chain: _ => Left(x),
  inspect: _ => `Left(${x})`,
});

export const truthyEither = p => x => (p ? Right : Left)(x);

export const fromNullable = x => truthyEither(notNull(x))(x);