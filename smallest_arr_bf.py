# Given an array of integers and a number x, find the smallest subarray with sum greater than the given value.

def smallest(lst, highest): 
    i = 0
    j = len(lst)-1
    temp = []

    while i < j:
        current_sum = sum(lst[i:j])
        if lst[i] > highest or lst[j] > highest:
            if lst[i] > highest:
                temp = lst[i:i+1]
                return temp
            else:
                temp = lst[j:j+1]
                return temp
        elif current_sum > highest:
            temp = lst[i:j]
            j -= 1
        elif current_cum < highest:
            if j < len(lst) - 1:
                j += 1
            i += 1
        else:
            i += 1
            j -= 1
    if not temp:
        return -1

    return temp

print(smallest_list([1, 4, 45, 6, 0, 19], 51))
print(smallest_list([1, 10, 5, 2, 7], 9))
print(smallest_list([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280))
print(smallest_list([1, 2, 4], 8))