// evenlyDivisible :: a -> a -> b
const evenlyDivisible = y => x => x % y === 0;

const dividesByFour = evenlyDivisible(4);
const dividesByHundred = evenlyDivisible(100);
const dividesByFourHundred = evenlyDivisible(400);

export default class Year {
	constructor(year) {
		this.year = year;
	}

	isLeap() {
	  return dividesByFour(this.year) &&
			!(dividesByHundred(this.year) &&
				!dividesByFourHundred(this.year))
	}
}