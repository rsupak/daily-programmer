'use strict';
function uniteUnique(...args) {
  let sortedArray = [];
  for (let index = 0; index < arguments.length; index++) {
    var argumentsArray = arguments[index];
    argumentsArray.forEach(function(element) {
      if (sortedArray.indexOf(element) < 0) {
        sortedArray.push(element);
      }
    });
  }
  return sortedArray;
}

// function uniteUnique() {
//   let concatArray = [];
//   let i = 0;
//   while (arguments[i]) {
//     concatArray = concatArray.concat(arguments[i]); i++;
//   }
//   let uniqueArray = concatArray.filter( (item, position) => concatArray.indexOf(item) === position);
//   return uniqueArray;
// }

// function uniteUnique(...args) {
//   var newArray;
//   var args = Array.prototype.slice.call(arguments);
//   newArray = args.reduce( (arrA, arrB) => arrA.concat(arrB.filter( (i) =>
//     arrA.indexOf(i) === -1)
//     ));
//   return newArray;
// }




console.log(uniteUnique([1, 3, 2], [5, 2, 1, 4], [2, 1]));
