def remove_dups(lst):
    temp = []
    for i in range(len(lst)):
        for j in lst[i+1:]:
            if lst[i] == j:
                temp.append(j)

    for i in temp:
        for j in lst:
            if i == j:
                lst.remove(j)

    return lst
    
lst1 = [23, 15, 2, 14, 14, 16, 20 ,52] 
lst2 = [2, 48, 15, 12, 26, 32, 47, 54] 
lst3 = [4, 78, 5, 6, 9, 25, 64, 32, 59] 
print(unionize(lst1, lst2, lst3))
# print(l1[2:])
