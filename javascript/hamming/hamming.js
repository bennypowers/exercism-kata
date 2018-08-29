import { zip } from 'ramda'

// divergent :: [a, a] -> Bool
const divergent = ([x, y]) => x !== y

export default class Hamming {
  compute(x, y) {
    if (x.length !== y.length) throw new Error('DNA strands must be of equal length.')
    return zip([...x], [...y]).filter(divergent).length
  }
}
