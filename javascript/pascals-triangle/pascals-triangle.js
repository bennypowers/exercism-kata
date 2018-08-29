const range = n => [...new Array(n).keys()];

// Curried add
// add :: Number -> Number -> Number
const add = x => y => x + y;

// Recursive factorial with proper tail call
// factTail :: (Number, Number) -> Number
const factTail = (x, acc) =>
  (x <= 1 ? acc : factTail(x - 1, x * acc));

// fact :: Number -> Number
const fact = n => factTail(n, 1);

// Curried Pascal for any position
// Computes a pascal position according to the formula
// http://mathworld.wolfram.com/PascalsTriangle.html
// pascalAt :: Number -> Number -> Number
const pascalAt = n => k =>
  fact(n) /
  (
    fact(k) *
    fact(n - k)
  );

// Computes a pascal row, where n is the row number
// pascalRow :: Number -> [Number]
const pascalRow = n =>
  range(n)
    .map(pascalAt(n - 1));

// Computes a triangle for a given number of rows
const triangle = rows =>
  range(rows)
    .map(add(1))
    .map(pascalRow);

export default class Triangle {
  constructor(rows) {
    // compute the rows
    this.rows = triangle(rows);
    // expose the last row
    this.lastRow = [...this.rows].pop();
  }
}
