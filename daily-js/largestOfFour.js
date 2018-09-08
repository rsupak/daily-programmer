function largestOfFour(arr) {
  var newArr = [];
  //for loop below sorts each array largest to smallest
  for (var i = 0; i < arr.length; i++) {
    arr[i].sort(function(a, b) {
      return b - a;
    });
    newArr = newArr.concat(arr[i].slice(0,1));
  }
  return newArr;
}


console.log(largestOfFour([[4, 5, 1, 3], [13, 27, 18, 26], [32, 35, 37, 39], [1000, 1001, 857, 1]]));
console.log(largestOfFour([[4, 5, 1, 3], [13, 27, 18, 26], [32, 35, 37, 39], [1000, 1001, 857, 1]]));
console.log(largestOfFour([[4, 9, 1, 3], [13, 35, 18, 26], [32, 35, 97, 39], [1000000, 1001, 857, 1]]));
