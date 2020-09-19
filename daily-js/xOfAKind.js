const xOfAKind = arr => {
  let cardHash = new Map();
  arr.forEach(elem => {
    cardHash.set(elem, (cardHash.get(elem) || 0) + 1)
  })
  let cardValues = []
  cardHash.forEach((value,_key) => cardValues.push(value))
  for (let value of cardValues) {
    if (value % Math.min(...cardValues) != 0) return false
    else continue
  }
  return true
}

console.log(xOfAKind([1, 1, 2, 3, 3, 2, 2]))
