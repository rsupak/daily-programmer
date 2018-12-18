def merge_sort(array, low, mid, high)
  dup = array.dup
  i = low
  j = mid + 1
  k = low

  while k <= high
    if i > mid
      array[k] = dup[j]
      j += 1
    elsif j > high
      array[k] = dup[i]
      i += 1
    elsif dup[j] < dup[i]
      array[k] = dup[j]
      j += 1
    else
      array[k] = dup[i]
      i += 1
    end
    k += 1
  end
end

def bottum_up_merge_sort(array)
  size = 1
  n = array.count
  while size < n
    p array
    low = 0
    while low < n - size
      high = [n - 1, size * 2 + low - 1].min
      mid = low + size - 1
      merge_sort(array, low, mid, high)
      low = high + 1
    end
    size *= 2
  end
  array
end

shuffled_array = Array.new(10) { rand(-100...100) }

puts "Random Array: #{shuffled_array}"
puts "Sorted Array: #{bottum_up_merge_sort(shuffled_array)}"
