def swap_sum(list1, list2):
    diff = abs(sum(list_1) - sum(list_2))
    i, j = 0, diff
    swap = False
    temp_list = []
    while not swap:
        if i in list_1 and j in list_2:
            temp_list = [i,j]
            swap = True
        else:
            i += 1
            j -= 1
    return temp_list


list_1 = [4, 1, 2, 1, 1, 2]
list_2 = [3, 6, 3, 3]

print(swap_sum(list_1, list_2))