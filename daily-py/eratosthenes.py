from math import sqrt

def eratosthenes(num):
    next_lowest_prime = 2
    num_arr = [x for x in range(2,num+1)]
    marked_nums = []
    while next_lowest_prime != num:
        for i in num_arr:
            if (next_lowest_prime <= sqrt(num)
                and i % next_lowest_prime == 0
                and i != next_lowest_prime):
                marked_nums.append(i)       
                # print("Marked numbers: {}".format(marked_nums))
        next_lowest_prime += 1

    for num in marked_nums:
        if num in num_arr:
            num_arr.remove(num)
    
    return num_arr
    
print(eratosthenes(500))
