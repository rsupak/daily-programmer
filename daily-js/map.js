const numbers = [2,4,6]

const addTwo = number => number + 2;

const result = mapArray(addTwo, numbers);

console.log(result);

function mapArray(transform, array) {
  let transformedArray = [];
  for (let i = 0; i < array.length; i++) {
    transformedArray.push(transform(array[i]));
  }
  return transformedArray;
}
