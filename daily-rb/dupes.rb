def dupe_indices(array)
  # Initializing hash with arrays
  dupes = Hash.new { |h, k| h[k] = [] }

  # iterate over each item and pass it into the hash
  # keyed on the element, adding the index to the hash array
  array.each.with_index do |elem, i|
    dupes[elem] << i
  end

  # select elements with arrays lengths > 1
  # _k is used because it is just a place holder
  # in the block (its not used).
  dupes.select { |_k, v| v.length > 1 }
end

arr = %w[a b c c b]
p dupe_indices(arr)
