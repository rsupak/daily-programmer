
function* makeRangeIterator(start = 0, end = 100, step = 1) {
  for (let i = start; i < end; i += step) {
    yield i;
  }
}

const it = makeRangeIterator(1, 10, 2);
const arr = Array.from(it)

function* fibonacci(num) {
  let fn1 = 0;
  let fn2 = 1;
  for (let i = 0; i < num; i++) {
    let current = fn1;
    fn1 = fn2;
    fn2 = current + fn1;
    yield current;
  }
}

const createSequence = function* (min = 0) {
  while (true) {
    yield min
    min += 1
  }
}

const sequence = Array.from(fibonacci(8));
console.log(sequence)

const isPrime = num => {
  if (num < 2) return false;

  for (const i of createSequence(2)) {
    if (i > Math.sqrt(num))
      return true
    if (num % i === 0)
      return false
  }
};

function* firstNPrimes(num) {
  let count = 0
  let i = 0
  while (count < num) {
    if (isPrime(i)) {
      count++
      yield i;
    }
    i++;
  }
}

console.log(Array.from(firstNPrimes(10))) //?. $
