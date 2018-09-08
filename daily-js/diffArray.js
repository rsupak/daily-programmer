'use strict';
/*
const diffArray = (arr1, arr2) => arr1
  .filter(x => arr2.indexOf(x) === -1)
  .concat(arr2.filter(x => arr1.indexOf(x) === -1));
*/


function diffArray(arr1, arr2) {
  return arr1
    .filter(function(x) {
      return arr2.indexOf(x) === -1;
    })
    .concat(arr2.filter(function(x) {
        return arr1.indexOf(x) === -1;
      }));
}

console.log(diffArray([1, 3, 2, 5], [9, 6, 3, 4, ]));
