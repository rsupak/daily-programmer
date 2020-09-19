def peak_finder(arr)
  peaks = []
  arr.each.with_index do |num, i|
    peaks << num if i.zero? && arr[i + 1] < num
    peaks << num if i < arr.length - 1 && (arr[i - 1] < num && arr[i + 1] < num)
    peaks << num if i == arr.length - 1 && arr[i - 1] < num
  end
  peaks
end

p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
