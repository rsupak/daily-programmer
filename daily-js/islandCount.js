const islandCount = matrix => {
  let count = 0;
  matrix.forEach((row, i) => {
    row.forEach((col, j) => {
      let prevCol = matrix[i][j - 1];
      let prevRow = matrix[i - 1];

      if (
        col === 1 &&
        !prevCol &&
        (i === 0 || j === 0 || !prevRow[j + 1]) &&
        (i === 0 || !prevRow[j])
      ) {
        count++;
      }
    });
  });
  return count;
};

const input = [
  [0, 1, 0, 1, 0],
  [0, 0, 1, 1, 1],
  [1, 0, 0, 1, 0],
  [0, 1, 1, 0, 0],
  [1, 0, 1, 0, 1]
];

console.log(islandCount(input));
