def island_count(input)
  count = 0
  input.each.with_index do |row, i|
    row.each.with_index do |col, j|
      p col
    end
  end
end

input = [
  [0, 1, 0, 1, 0],
  [0, 0, 1, 1, 1],
  [1, 0, 0, 1, 0],
  [0, 1, 1, 0, 0],
  [1, 0, 1, 0, 1]
]

island_count(input)
