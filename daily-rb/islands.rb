def count_islands(arr)
  count = 0
  arr.each.with_index do |_, i|
    
    arr[i].each.with_index do |_, j|
      
      next if i.zero? && j.zero? && arr[i][j] == 1
      next if arr[i][j] == 1
      next if arr[i][j - 1] == 1
      next if arr[i][j + 1] == 1
      next if arr[i - 1][j] == 1
      next if arr[i + 1][j] == 1
      count += 1
    end
  end
  count
end

p count_islands([[1,1,1,1,0],[1,1,0,1,0],[1,1,0,0,0],[0,0,0,0,0]])
      