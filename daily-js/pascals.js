// function createPascalTriangle(rows) {
//   let triangle = [];

//   for (let i = 0; i < rows; i++) {
//     triangle[i] = new Array(i+1);
    
//     for (let j = 0; j < i + 1; j++) {
//       if (j === 0 || j === i) {
//         triangle[i][j] = 1;
//       } else {
//         triangle[i][j] = triangle[i-1][j-1] + triangle[i-1][j];
//       }
//     }
//   }
//   return triangle;
// }
// tri = createPascalTriangle(8)
// for (let i = 0; i < tri.length; i++) {
//   console.log(tri[i])
// }
// console.log(createPascalTriangle(8))
function pascal(depth) {
  let results = [];
  
  for (let r = 0; r < depth; r++) {
    let temp = [];
    for (let c = 0; c < r + 1; c++) {
      if (c === 0 || c === r) {
        temp.push(1);
      } else {
        temp.push(temp[r-1][c-1] + temp[r-1][c]);
      }
    }
  }
  return results;
}
