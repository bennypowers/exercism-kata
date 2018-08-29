export const add = x => y => x + y;

export const multiply = x => y => x * y;

export const getTime = date => date.getTime();

export const msToDate = m => new Date(m);

export const compose = (...fns) =>
  fns.reduce((f, g) => (...args) => f(g(...args)));