
// function addTogether() {
//   return addAgain()
// }
//
// addTogether(2,3);



function addTogether() {
  if (arguments.length === 1 && typeof arguments[0] === 'number'){
    var x = arguments[0];
    return function(y) {
      if (typeof y === 'number') {
        return x + y
      }
    }
    return addFunction;
  } else if (typeof arguments[0] === 'number' && typeof arguments[1] === 'number') {
    return arguments[0] + arguments[1];
  }
}


console.log(addTogether(2, 3));
console.log(addTogether(2)(3));
console.log(addTogether("http://bit.ly/IqT6zt"));
console.log(addTogether(2, "3"));
//console.log(addTogether(2)([3]));
