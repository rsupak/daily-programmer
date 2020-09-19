# def missing_number(arr)
#   diff = find_difference(arr)
#   arr.each_index do |i|
#     return arr[i] + diff if arr[i + 1] != arr[i] + diff
#   end
# end

# def find_difference(arr)
#   differences = Hash.new { |hash, key| hash[key] = 0 }
#   arr.each_index do |i|
#     break if i == arr.length - 1

#     differences[arr[i + 1] - arr[i]] += 1
#   end
#   differences.keys.each do |k|
#     return k if arr.length * k + arr.first == arr.last
#   end
# end

def missing_number(arr)
  diff = (arr.last - arr.first) / arr.length
  arr.each_index { |i| return arr[i] + diff unless diff + arr[i] == arr[i + 1] }
end

p missing_number([15, 13, 12]) # => 14
p missing_number([5, 7, 11, 13]) # => 9
p missing_number([-10, -7, -4, 2]) #=> -1
