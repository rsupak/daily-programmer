def smallest(lst, flag):
    length = len(lst)
    smallest = len(lst)
    current_sum = 0
    start = 0
    end = 0
    while end < length:
        while current_sum <= flag and end < length:
            current_sum += lst[end]
            end += 1

        while current_sum > flag:
            current_sum -= lst[start]
            
            # tests smallest while premise is true
            if end - start < smallest:
                smallest = end - start
            # if smallest ever = 0, 1 item is larger than flag
            if smallest == 0:
                return 1

            start += 1

    # if current_sum never equals flag
    if smallest == len(lst):
        return "No solution"
    return smallest
            
print(smallest([1, 4, 45, 6, 0, 19], 51))
print(smallest([1, 10, 5, 2, 7], 9))
print(smallest([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280))
print(smallest([1, 2, 4], 8))