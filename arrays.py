def reverse(lst):
    return lst[::-1]


def rotate(lst, shift=1):
    temp = lst[:]
    for i in range(len(lst)):
        new_pos = i - shift
        print(new_pos)
        if new_pos < 0:
            temp[len(lst) - shift] = lst[i]
        elif new_pos > len(lst)-1:
            temp[shift - len(lst)] = lst[i]
        else:
            temp[new_pos] = lst[i]
    return temp
        


x = reverse(["a","b","c"])
# print(x)

y = rotate(["a","b","c"])
print(y)
y = rotate(["a","b","c"],-3)
print(y)
y = rotate(["a","b","c"],2)
print(y)
