'use strict';
const checkPositive = (arr) => arr.every(x => x >= 0);

console.log(checkPositive([1, 2, 3, -4, 5]));
