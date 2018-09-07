def plus_one(arr):
    temp_arr = arr[::-1]
    num_to_add = 1
    for i in range(len(temp_arr)):
        new_int = temp_arr[i] + num_to_add
        temp_arr[i] = new_int
        if new_int > 9:
            temp_arr[i] = new_int % 10
        else:
            num_to_add = 0
    return temp_arr[::-1]

print(plus_one([1, 9, 9, 9]))


# for item in arr:
#         if not isinstance(item, int):
#             return "Invalid Array"