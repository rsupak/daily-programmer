def reverse(lst):
    return lst[::-1]


def rotate(lst, shift=1):
    if shift >= 0:
        while shift > 0:
            temp = lst.pop(0)
            lst += [temp]
            shift -= 1
    else:
        while shift < 0:
            lst = [lst.pop()] + lst
            shift += 1
    return lst
        


x = reverse(["a","b","c"])
print(x)

y = rotate(["a","b","c"])
print(y)
y = rotate(["a","b","c"],-3)
print(y)
y = rotate(["a","b","c"],2)
print(y)
