// Create 3 random arrays
const createRandomNumber = (min, max) => {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1) + min);
}

let arr1 = Array.from({length: 3}, () => createRandomNumber(-100, 100));
let arr2 = Array.from({length: 3}, () =>  createRandomNumber(-100, 100));
let arr3 = Array.from({length: 3}, () => createRandomNumber(-100, 100));

// let longArray = arr1.concat(arr2).concat(arr3)

const mergeSort = arr => {
  if (arr.length <= 1) return arr;

  const mid = Math.floor(arr.length / 2);
  const left = arr.slice(0, mid);
  const right = arr.slice(mid);

  return merge(mergeSort(left), mergeSort(right));
}

const merge = (left, right) => {
  let result = []
  while (left.length > 0 && right.length > 0) {
    result.push(left[0] < right[0] ? left.shift() : right.shift());
  }
  return result.concat(left).concat(right);
}

const ultimateMerge = (...args) => {
  return args.reduce((acc, elem) => merge(mergeSort(acc), mergeSort(elem)));
}

console.log(ultimateMerge(arr1, arr2, arr3))

// merges and sorts final array

// console.log(mergeSort(longArray))

// console.log(result)
