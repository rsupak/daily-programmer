def candy(lst):
    length = len(lst)
    i = 0
    candies = 0
    while i < len(lst):
        if i == 0:
            if lst[i+1] > lst[i]:
                candies += 1
            else:
                candies += 2
         
        elif lst[i] <= lst[i-1]:
            candies += 1
        elif lst[i] > lst[i-1]:
            candies += 2

        i += 1
    return candies

print(candy([1,0,2]))
print(candy([1,2,2]))
print(candy([0,1,2]))
print(candy([2,1,0]))
        