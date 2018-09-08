


// function dropElements(arr, func) {
//   let keptElements = [];
//   for (let i = 0; i < arr.length; i++) {
//     if (func(arr[i])) {
//       keptElements.push(arr.slice(i));
//     }
//   }
//   return keptElements[];
// }
//
// console.log(dropElements([1, 2, 3, 4], function(n) {return n > 5;}))
//
// const allFollowingFirstMatch = (arr, shouldKeep) => {
//   for (let i = 0; i < arr.length; i++)
//     if (shouldKeep(arr[i]))
//       return arr.slice(i);
//   return [];
// }

// const allFollowingFirstMatch = (arr, shouldKeep) => {
//   let isMatched = false
//   const kept = []
//   for (let x of arr) {
//     if(isMatched)
//        kept.push(x)
//     else if (shouldKeep(x)) {
//       isMatched = true
//       kept.push(x)
//     }
//   }
//   return kept;
// }


const dropElements = (arr, func) =>
   arr.slice(arr.findIndex(func) >= 0 ? arr.findIndex(func): arr.length, arr.length);


console.log(dropElements([1, 2, 3, 4], function(n) {return n >= 3;}))
console.log(dropElements([0, 1, 0, 1], function(n) {return n === 1;}))
console.log(dropElements([1, 2, 3], function(n) {return n > 0;}))
console.log(dropElements([1, 2, 3, 4], function(n) {return n > 5;}))
console.log(dropElements([1, 2, 3, 7, 4], function(n) {return n > 3;}))
console.log(dropElements([1, 2, 3, 9, 2], function(n) {return n > 2;}))
