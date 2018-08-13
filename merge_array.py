def merge_arrays(lst1, lst2):
    max_len = len(lst1) + len(lst2)
    temp_list = []

    while len(temp_list) < max_len:
        if not lst1:
            temp_list += lst2
        elif not lst2:
            temp_list += lst1
        elif lst1[0] <= lst2[0]:
            temp_list.append(lst1.pop(0))
        else:
            temp_list.append(lst2.pop(0))
    
    return temp_list

a = [1,2,3,6,7,9]
b = [2,4,5,7,9,12]

print(merge_arrays(a,b))


