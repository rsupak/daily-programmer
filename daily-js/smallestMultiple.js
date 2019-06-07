const leastCommonMultiple = (a, b) => Math.abs(a * b) / greatestCommonDivisor(a, b);

const greatestCommonDivisor = (a, b) => !b ? a : greatestCommonDivisor(b, a % b);

const range = (start, end) => Array(end - start + 1).fill().map((_, i) => start + i);

const smallestCommons = (arr) => {
  const start = Math.min(...arr);
  const end = Math.max(...arr);
  return range(start, end).reduce( (a, b) => leastCommonMultiple(a, b) );
}

console.log(smallestCommons([5,13]))
