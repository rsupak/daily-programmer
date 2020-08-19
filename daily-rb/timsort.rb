# Hybrid sort method that takes advantage of the time complexity advantages
# inherent in the insertion and merge sort algorithms. For smaller sub-arrays
# insertion sort offers the most efficient sorting method, however, once the 
# sub-arrays grow larger than 64 items, insertion sort becomes less efficient
# than merge sort. At this point merge sort takes over and completes the sort
# of the remaining sub-arrays. This efficiency relies on comparable sub-array
# sizes. Finally, as the smaller arrays are being structured from the original
# array into runs, The algorithm looks for natural ordered runs already present 
# in the original array, and builds runs utilizing these natural ordered runs
# which will reduce the overall number of calls to the insertion sort method.

MIN_RUN = 4

def tim_sort(array)
  runs, new_run = [],[]
  length = array.length

  (0...length).each do |i|
    new_run << array[i]
    if i == length - 1
      runs << insertion_sort(new_run)
      new_run = []
    end
    next if new_run.length < 2

    decrements = new_run[0] > new_run[1]
    decrements ? decremental_sort(new_run) : incremental_sort(new_run)
    puts "New Run: #{new_run}"
    unless new_run.length <= MIN_RUN
      runs << (decrements ? new_run.reverse : new_run)
      new_run = []
    end
  end

  puts "Runs: #{runs}"

  sort_runs(runs)
end

# helper method places aberrant addition to decrementing array
# in correct order using binary insertion sort
def decremental_sort(new_run)
  if new_run[-2] < new_run[-1]
    elem = new_run.pop
    insert_at = new_run.bsearch_index { |i| i < elem }
    new_run.insert(insert_at, elem)
  end
  new_run
end

# helper method places abberant addition to incrementing array
# in correct order using binary insertion sort
def incremental_sort(new_run)
  if new_run[-2] > new_run[-1]
    elem = new_run.pop
    insert_at = new_run.bsearch_index { |i| i > elem }
    new_run.insert(insert_at, elem)
  end
  new_run
end

# Merges each run into sorted order
def sort_runs(runs)
  sorted_array = []
  runs.each do |run|
    sorted_array = merge(sorted_array, run)
  end
  sorted_array
end

# helper method to combine the runs into the final sorted array.
def merge(left, right)
  sorted = []
  while [left, right].none?(&:empty?)
    sorted << (left[0] < right[0] ? left.shift : right.shift)
  end
  sorted + left + right
end

# Sorts smaller arrays that contains the last item in the original array.
# Insertion sort is used here because the final array may only contain
# one or two items 
def insertion_sort(array)
  puts "Insertion Sort: #{array}"
  array.each_index do |index|
    key = array[index]

    check = index - 1
    while check >= 0 && key < array[check]
      array[check], array[check + 1] = array[check + 1], array[check]
      check -= 1
    end
  end
  array
end

shuffled_array = Array.new(25) { rand(-100...100) }
puts "Random Array: #{shuffled_array}"
puts "Sorted Array: #{tim_sort(shuffled_array)}"
