def weakest_rows(mat, k)
  mat.map.with_index { |arr, i| [arr.reduce(:+), i] }
#      .sort { |a, b| a[0] <=> b[0] }
#      .map { |arr| arr[1] }
#      .take(k)
end

mat = [[1,1,0,0,0],
       [1,1,1,1,0],
       [1,0,0,0,0],
       [1,1,0,0,0],
       [1,1,1,1,1]]

p weakest_rows(mat, 3)
