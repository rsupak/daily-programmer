def bubblesort(array)
  swapped = true
  while swapped do
    0.upto(array.length-2) do |i|
      swapped = false
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end
  end
  array
end
