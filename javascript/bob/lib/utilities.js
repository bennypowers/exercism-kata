// filter :: Bool p, Arr xs => p -> xs -> xs
export const filter = p => xs => (Array.from(xs)).filter(p);

// toLowerCase :: StringCoercable c, Str s => c -> s
export const toLowerCase = c => String(c).toLowerCase();

// all :: (a -> Bool) fs => fs -> f
export const all = (...fns) => value =>
  fns.every(fn => !!fn(value) === true);
