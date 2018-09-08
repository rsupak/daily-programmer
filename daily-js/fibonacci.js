const fibSequence = (max) => {
  let fibArray = [];
  let fibonacci = function *(max) {
    let fibNum1 = 0;
    let fibNum2 = 1;
    while (true) {
      let current = fibNum1;
      fibNum1 = fibNum2;
      fibNum2 = current + fibNum1;
      var reset = yield current;
      if (reset) {
          fibNum1 = 0;
          fibNum2 = 1;
      }
    }
  }

  for (let number of fibonacci(max)) {
    console.log(number);
  }
}

console.log(fibSequence(10))


//
// const test = (max) => {
//   function* numbers(max) {
//     let n = 0;
//     while (n < max) {
//       yield n++;
//     }
//   }
//   for (let n of numbers(max)) {
//     console.log(n);
//   }
// }
//
// console.log(test(10))
