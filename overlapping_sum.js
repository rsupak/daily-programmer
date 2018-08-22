function overlappingSum(arr1, arr2) {
    const seen = {};
    let sum = 0;
    arr1.forEach(num => (seen[num] = true));
    arr2.forEach(num => {
      if (seen[num]) sum += num;
    });
  
    return sum * 2;
  }

let arr1 = [1, 5, 3, 8];
let arr2 = [5, 4, 6, 7];
let x = overlappingSum(arr1, arr2)

console.log(x)

let arr3 = [1, 5, 3, 8]
let arr4 = [5, 1, 8, 3]
let y = overlappingSum(arr3, arr4)
console.log(y)