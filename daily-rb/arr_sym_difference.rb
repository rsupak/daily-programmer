def sym_difference(arr1, arr2)
  (arr1 - arr2) + (arr2 - arr1)
end

arr1 = [1,2,4]
arr2 = [1,2,3]
p sym_difference(arr1, arr2).sort

arr1, arr2 = [[1, "calf", 3, "piglet"], [7, "filly"]]

p sym_difference(arr1, arr2)
arr1, arr2 = [["diorite", "andesite", "grass", "dirt", "pink wool", "dead shrub"], ["diorite", "andesite", "grass", "dirt", "dead shrub"]]

p sym_difference(arr1, arr2)

arr1, arr2 = [["andesite", "grass", "dirt", "pink wool", "dead shrub"], ["diorite", "andesite", "grass", "dirt", "dead shrub"]]

p sym_difference(arr1, arr2)

arr1, arr2 = [[], ["snuffleupagus", "cookie monster", "elmo"]]

p sym_difference(arr1, arr2)
