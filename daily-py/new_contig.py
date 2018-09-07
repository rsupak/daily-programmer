def find_max_sum(lst, i=0, j=0, sum_nums=0,max_sum=0):
    if i == len(lst):
        return max_sum
    else:
        if i == j:
            sum_nums = lst[i]
            max_sum = sum_nums
            j += 1
        elif j > i and j < len(lst):
            sum_nums = sum(num_list[i:i+j])
            if sum_nums > max_sum:
                max_sum = sum_nums
                j += 1
            else:
                i += 1
                j = i
        return find_max_sum(lst, i, j, 0, max_sum)

num_list = [2, -8, 3, -2, 4, -10]

i = 0
j = 0
sum_nums = 0
max_sum = 0

print(find_max_sum(num_list, i, j))

# i = 0, j = 0, sum_nums = 2, max_sum = 2
# i = 0, j = 1, sum_nums = -6, max_sum = 2
# i = 0, j = 1, sum_nums = -6, max_sum = 2
# i = 0, j = 1, sum_nums = -6, max_sum = 2

# Contiguous Sequence
I believe you have `sum` and `maxSum`, and `sum = sum + list[j]`.  
`range` would be the `i` and `j` of the `maxSum`.  
basically, you would reset every time the sum falls below 0.

`[2, -8, 3, -2, 4, -10, 15, 2]`
i = 0, j = 0, sum = 0+2 = 2, maxSum = 2, range = [0, 0] // since `list[j]` is 2.  store this as `maxSum`
i = 0, j = 1, sum = 2-8 = -6, maxSum = 2, range = [0, 0] // when it falls below 0, increment `j`, and reset `i` and `sum`
i = 2, j = 2, sum = 0+3 = 3, maxSum = 2, range = [0, 0] // leave i and increment `j`
i = 2, j = 3, sum = 3-2 = 1, maxSum = 2, range = [0, 0] // leave i and increment `j`
i = 2, j = 4, sum = 1+4 = 5, maxSum = 5, range = [2, 4] // update maxSum and range
i = 2, j = 5, sum = 5-10 = -5, maxSum = 5, range = [2, 4] // reset i, j and sum
i = 6, j = 6, sum = 0+15 = 15, maxSum = 15, range = [6, 6] // update maxSum and range
i = 6, j = 7, sum = 15+2 = 17, maxSum = 17, range = [6, 7] // update maxSum and range