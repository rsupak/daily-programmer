/* Create a function that will output the data from a matrix in a spiral */

const spiral = matrix => {
  let output = [];
  // loop until matrix is depleted
  while (matrix.length > 0) {
    // push top array to output
    output = output.concat(matrix.shift())
    // push last elements of each remaining inner array to outputs
    for (let arr of matrix) {
      output.push(arr.pop())
    }
    // push last array in matrix to output if matrix contains arrays.
    if (matrix.length > 0) {
      output = output.concat(matrix.pop().reverse())
    }
    for (let arr of [...matrix].reverse()) {
      output.push(arr.shift())
    }
  }
  return output
}

console.log(spiral([[1,2,3],[4,5,6],[7,8,9]]));
console.log(spiral([
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9, 10, 11, 12],
  [13, 14, 15, 16],
  [17, 18]
]))
