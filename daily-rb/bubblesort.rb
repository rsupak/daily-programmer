# frozen_string_literal: true

# bubblesort compares the value at each index of an array of numbers
# and if the value of index > index + 1, the values are swapped and the sort 
# starts again at index[0] if there is no swap made, the array is sorted.
def bubblesort(arr)
  0.upto(arr.length - 2) do |idx|
    next unless arr[idx] > arr[idx + 1]

    arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
    bubblesort(arr)
  end
  arr
end

def bubblesort_itr(arr)
  swapped = true
  i = 0
  while i < arr.length - 1 do
    if arr[i] > arr[i + 1]
      arr[i], arr[i + 1] = arr[i + 1], arr[i]
      i = 0
    else
      i += 1
    end
  end
  arr
end
shuffled_array = Array.new(10) { rand(-100...100) }
shuffled_copy = shuffled_array.clone

puts "Random Array: #{shuffled_array}"
puts "Recursively Sorted Array: #{bubblesort(shuffled_array)}"
puts "Random Array: #{shuffled_copy}"
puts "Iteratively Sorted Array: #{bubblesort_itr(shuffled_copy)}"
