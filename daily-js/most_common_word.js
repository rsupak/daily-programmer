// This code finds the most common word in a sentence
/*
This is a multi-line comment
*/
const mostCommon = (str, banned) => {
  let hash = new Map();
  str = str.match(/\b(\w+)\b/g)
    .filter(word => !banned.includes(word.toLowerCase()))
    .map(word => word.toLowerCase())

  for (let word of str) {
    hash.set(word, hash.has(word) ? hash.get(word) + 1 : 1);
  }
  return str.reduce((prev, current) => (hash.get(prev) > hash.get(current)) ? prev : current);
}

let str = "Bob hit a ball, the hit BALL flew far after it was hit.";
console.log(mostCommon(str, ['hit']))
