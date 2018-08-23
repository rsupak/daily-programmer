def overlapping_sums(arr1, arr2):
    set1, set2 = set(arr1), set(arr2)
    overlaps = set1 & set2
    sums = sum(list(overlaps))

    return sums * 2

arr1 = [1, 5, 3, 8]
arr2 = [5, 4, 6, 7]
x = overlapping_sums(arr1, arr2)
print(x)

arr3 = [1, 5, 3, 8]
arr4 = [5, 1, 8, 3]
y = overlapping_sums(arr3, arr4)
print(y)