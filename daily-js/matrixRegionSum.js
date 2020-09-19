const matrixRegionSum = (matrix, start, stop) => {
  let sumArray = []
  for (let i = start[1]; i <= stop[1]; i++) {
    for (let j = start[0]; j <= stop[0]; j ++) {
      sumArray.push(matrix[i][j])
    }
  }
  return sumArray.reduce((acc, cur) => acc + cur)
}

let testMatrix = [[1,2,3,4],[5,6,7,8],[9,0,1,2]]
let start = [1, 1]
let stop = [3, 2]
console.log(matrixRegionSum(testMatrix, start, stop))
