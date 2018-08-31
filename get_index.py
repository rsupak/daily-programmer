def get_index(arr, num):
    return arr.index(num) if num in array else -1

array = [1, 3, 5, 7, 9]

print(get_index(array, 4))
print(get_index(array, 5))