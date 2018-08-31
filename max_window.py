num_list = [5, 2, 9, 1, 1, 9, 4, 8, 3, 6, 1]

def max_window(lst, width):
    length = len(lst)
    sums = 0
    dict_list = dict()

    for i in range(length):
        if i + width - 1 < length:
            if i + width < length:
                dict_list[i] = lst[i:i + width]
            else:
                dict_list[i] = lst[i:]

    for key in dict_list.keys():
        temp_sum = sum(dict_list[key])
        sums = temp_sum if temp_sum > sums else sums

    return sums

print(max_window(num_list, 3)) # => 21
print(max_window(num_list, 2)) # => 13
print(max_window(num_list, 4)) # => 24