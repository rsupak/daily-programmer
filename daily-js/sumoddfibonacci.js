"use strict";

function sumFibs(max) {
  let fib = [0, 1];
  let filteredFib = [];
  for (var i = 2; fib[fib.length - 1] <= max; i++ ) {
    fib.push( fib[fib.length - 1] + fib[fib.length - 2] );
  }
  console.log(fib)
  fib.forEach(function(element) {
    if (element <= max && element % 2 !== 0) {
      filteredFib.push(element);
    }
  });
  return filteredFib.reduce(function(a,b) {
    return a + b;
  });
}


console.log(sumFibs(75025));
