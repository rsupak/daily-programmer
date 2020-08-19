def bubblesort(arr):
    for i in range(len(arr) - 1):
        if arr[i] > arr[i + 1]:
            arr[i], arr[i + 1] = arr[i + 1], arr[i]
            bubblesort(arr)
    return arr


x = bubblesort([-21, 67, 13, 37, 33, 73, 50, 93, 57, -39])
print(x)
