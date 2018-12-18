# Method to find the largest arrangement of integers in a given array
def largest_arrangement(arr)
  return 'Empty Array' if arr.empty?

  arr.each do |num|
    return 'Only positive numbers are accepted' if num < 0
  end

  str_array = []
  sorted = sort(arr)
  sorted.map { |num| str_array << num.to_s}
  sorted.join.to_i
end

# Utilizes merge sort algorithm to rearrange array
# drawing upon the helper methods (merge & compare)
def sort(arr)
  return arr unless arr.size > 1

  mid = arr.size / 2
  left, right = sort(arr[0...mid]), sort(arr[mid..-1])

  merge(left, right)
end

# helper method to combine the left and right arrays in sorted order.
# sorted order is determined by the compare helper method
def merge(left, right)
  sorted = []
  while [left, right].none?(&:empty?)
    sorted << (compare(left[0], right[0]) ? left.shift : right.shift)
  end
  sorted + left + right
end

# Self defined comparator method that compares integer values of two concatenated 
# integers (using the to_s method) determines which new value is larger after 
# returning the new strings to integers.
def compare(left, right)
  left_right = left.to_s + right.to_s
  right_left = right.to_s + left.to_s
  left_right.to_i > right_left.to_i
end

puts "#{largest_arrangement([4, 50, 8, 145])}" # returns 8504145 (8-50-4-145)

puts largest_arrangement([4, 40, 7]) # returns 7440 (7-4-40)

# largest_arrangement([4, 46, 7]) returns 7464 (7-46-4)

# largest_arrangement([5, 2, 1, 9, 50, 56]) returns 95655021 (9-56-5-50-21)

puts "#{largest_arrangement([])}" #returns "Empty Array"

# largest_arrangement([6]) returns 6

# largest_arrangement([2, 3, 1, 9, -50]) returns "Only positive numbers are accepted"
