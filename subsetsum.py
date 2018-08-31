def has_subset_sum(arr, total):
    if total in arr:
        return True
    else:
        found = False
        i = 0
        j = len(arr) - 1
        while found == False:
            if sum(arr[i:j]) == total:
                return True
            while j > i:
                if arr[i] + arr[j] == total:
                    found = True
                    return found
                else:
                    j -= 1
            i += 1
            j = len(arr) - 1
            if j <= i:
                return found



arr = [1, 2, 3, 4]
total = 
x = has_subset_sum(arr, total)
print(x)