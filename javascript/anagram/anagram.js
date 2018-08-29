const normalizeString = x =>
  JSON.stringify(
    [...x.toLowerCase()]
      .sort()
  )

const isAnagram = x => y =>
	x !== y &&
  x.toLowerCase() !== y.toLowerCase() &&
	x.length === y.length &&
  normalizeString(x) === normalizeString(y)

export default class Anagram {
	constructor(string) {
		this.string = string
	}

	matches(list) {
		return list.filter(isAnagram(this.string))
	}
}
