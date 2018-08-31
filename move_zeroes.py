def move_zeroes(arr):
    i = 0
    temp = []
    while i < len(arr):
        if arr[i] != 0:
            temp.append(arr.pop(i))
        else:
            i += 1
    return temp + arr
            
lst = [0,0,0,1,2,3,0,0,4,0,1]
x = move_zeroes(lst)
print(x)