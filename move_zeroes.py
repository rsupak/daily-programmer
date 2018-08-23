def sort(lst):
    swap = False
    for i in range(len(lst) - 1):
        if lst[i] == 0 and lst[i] < lst[i+1]:
            swap = True
            lst[i],lst[i+1] = lst[i+1],lst[i]
    if swap:
        sort(lst)
    return lst

lst = [1, 2, 0, 3, 4, 0, 5, 6, 0]
x = sort(lst)
print(x)