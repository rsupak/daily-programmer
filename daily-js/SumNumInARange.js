
// function sumAll(arr) {
//   const max = Math.max(...arr);
//   const min = Math.min(...arr);
//   const newArr = [];
//   for (var i = min; i <= max; i++) {
//     newArr.push(i);
//   }
//   return newArr.reduce( (a, b) => a + b);
// }
//
// console.log(sumAll([10, 5]));

/*
Pass an array to the function
Sum numbers in range of index[0]
to index[1];
ex. [1, 4] = 1 + 2 + 3 + 4 = 10
*/
const range = (min, max) => Array(max - min + 1).fill().map((_, i) => min + i);

const sumAll = (arr) => {
  const max = Math.max(...arr);
  const min = Math.min(...arr);
  return range(min, max).reduce( (a, b) => a + b)
}

console.log(sumAll([1, 5]));
