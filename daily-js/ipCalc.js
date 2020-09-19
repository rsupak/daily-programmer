const stringToIntArray = str => {
  return str.split(".").map(x => parseInt(x));
};

const getResultArray = (arr1, arr2) => {
  let resultArray = [];
  for (let i = 0; i < 4; i++) {
    resultArray.push(arr1[i] - arr2[i]);
  }
  return resultArray;
};

const countAddresses = arr => {
  arr = arr.reverse();
  for (let i = 0; i < 4; i++) {
    arr[i] = arr[i] * Math.pow(256, i);
  }
  return Math.abs(arr.reduce((a, b) => a + b, 0));
};

let input1 = "20.0.0.10";
let input2 = "20.0.1.0";
let arr1 = stringToIntArray(input1);
let arr2 = stringToIntArray(input2);
let resultArray = getResultArray(arr1, arr2);
console.log(countAddresses(resultArray));
