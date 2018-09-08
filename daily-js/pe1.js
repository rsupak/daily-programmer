let sum = 0;
let arr = [];
for (var num = 1; num < 1000; num++) {

  if (num % 3 === 0 || num % 5 === 0) {
    arr.push(num);
  }
}
var total = arr.reduce(function(sum, value) {
  return sum + value
}, 0);
console.log(total);
