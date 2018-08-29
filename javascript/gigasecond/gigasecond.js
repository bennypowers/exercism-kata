import { add, compose, getTime, msToDate, multiply } from './utils.js';

const GIGASECOND = 10e9; // seconds

const msToSeconds = multiply(0.01);

const secondsToMs = multiply(100);

const anniversary = add(GIGASECOND);

const gigasecond = compose(msToDate, secondsToMs, anniversary,
                           msToSeconds, getTime);

export default class Gigasecond {
  constructor(date) { this.current = date; }
  date() { return gigasecond(this.current); }
}