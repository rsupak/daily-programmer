let arr1 = [1, 2.4, 3];
let arr2 = [7, 2.4, 3];

// function zipSum(arr1, arr2) {
//   let newArray = []
//   for (let i = 0; i < arr1.length; i++) {
//     newArray.push(arr1[i] > arr2[i] ? arr1[i] : arr1[i] < arr2[i] ? arr2[i] : arr1[i] + arr2[i]);
//   }

//   return newArray;
// }


const zipSum = (arr1, arr2) => {
  return (
    arr1.map((elem, i) => {
      if (arr1[i] > arr2[i]) return arr1[i];
      if (arr1[i] < arr2[i]) return arr2[i];
      return arr1[i] + arr2[i];
    })
  );
}


// console.log(zipSum(arr1, arr2))
console.log(zipSum(arr1, arr2))
