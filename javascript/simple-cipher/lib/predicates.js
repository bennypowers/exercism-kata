// Predicates

// Ord a :: a -> a -> bool
export const gt = x => y => y > x;

// regex -> str -> bool
export const match = r => xs => xs.match(r);

export const isAlpha = match(/^[A-z]+$/)

export const lowerAlphas = match(/^[a-z]+$/);

export const notNull = x => x != null;

export const positiveNumber = gt(0);
