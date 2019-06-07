'use strict';


function flatArray(arr) {
  return arr.reduce(function(a, b) {
    if (Array.isArray(b)) {
      return a.concat(flatArray(b));
    }
    return a.concat(b);
  }, []);
}

console.log(flatArray([1, [2], [3, [[4]]]]));
