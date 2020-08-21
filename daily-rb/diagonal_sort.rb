def diagonal_sort(mat)
  matrix_hash = Hash.new { |h, k| h[k] = [] }
  new_arr = Array.new(mat.size) { Array.new(mat[0].size) }
  (0...mat.size).each do |i|
    (0...mat[0].size).each do |j|
      matrix_hash[i - j] << mat[i][j]
    end
  end

  matrix_hash.values.each(&:sort!)

  (0...mat.size).each do |i|
    (0...mat[0].size).each do |j|
      new_arr[i][j] = matrix_hash[i - j].shift
    end
  end
  new_arr
end


p diagonal_sort(
  [
    [3,3,1,1],
    [2,2,1,2],
    [1,1,1,2]
  ]
)

# [1, 1, 1, 1]
# [1, 2, 2, 2]
# [1, 2, 3, 3]
