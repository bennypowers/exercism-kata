import range from './range.js';

export default class Matrix {
  constructor(mString) {
    const rows = mString
      .split('\n')
      .map(inner => inner
        .split(' ')
        .map(Number));

    const columns = range(rows[0].length)
      .map((_, i) => range(rows.length).map((_, j) => rows[j][i]));

    this.rows = rows;
    this.columns = columns;
  }
}