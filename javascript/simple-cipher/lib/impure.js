/* eslint-disable no-console */

// impure. str -> f -> f
export const trace = tag => (x) => { console.log(tag, x); return x; };

// impure. logs to console error
export const impureLogError = console.error;