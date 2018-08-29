// Bool p, Arr xs :: p -> xs -> xs
export const filter = p => xs => (Array.from(xs)).filter(p);

// StringCoercable c, Str s :: c -> s
export const toLowerCase = c => String(c).toLowerCase();

// Bool fs :: fs -> f
export const all = (...fns) => value =>
  fns.every(fn => !!fn(value) === true);

// Not used for this exercise, but
// leaving it here because it's bitchin'
// 🎩 https://medium.com/@achille.urbain
export const compose = (...fns) =>
  fns.reduce((f, g) => (...args) => f(g(...args)));