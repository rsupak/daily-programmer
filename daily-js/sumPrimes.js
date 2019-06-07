
function sumPrimes(maxNumber){
  let primeArray = [];
  let count = 0;
  for (let j = 1; j <= maxNumber; j++) {
    for (let i = 1; i <= j; i++) {
      if (j % i === 0) {
        count++;
      }
    }

    if (count === 2) {
      primeArray.push(j);
    }
    count = 0;
  }

  // return primeArray;
  return primeArray.reduce(function(a, b) {
    return a + b;
  });
}

console.log(sumPrimes(977))
