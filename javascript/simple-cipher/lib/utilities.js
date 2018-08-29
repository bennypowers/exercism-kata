// Utilities

// a -> a
export const id = x => x;

// num -> num -> num
export const add = x => y => x + y;

// num -> num -> num
export const subtract = x => y => y - x;

// num -> num
export const modulo = x => y => y % x;

// num -> str
export const fromCharCode = c => String.fromCharCode(c);

// str -> num
export const toCharCode = x => x.charCodeAt(0);