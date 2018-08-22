def sums(arr1, arr2):
    temp_dict = {}
    sum = 0
    for num in arr1:
        temp_dict[num] = 1
    
    for num in arr2:
        if num in temp_dict.keys():
            temp_dict[num] += 1
    
    for key, value in temp_dict.items():
        if value > 1:
            sum += key * value
    
    return sum

arr1 = [1, 5, 3, 8]
arr2 = [5, 4, 6, 7]
x = sums(arr1, arr2)
print(x)

arr3 = [1, 5, 3, 8]
arr4 = [5, 1, 8, 3]
y = sums(arr3, arr4)
print(y)