from functools import reduce

def odd_sum(lst):
    return reduce(lambda x, y: x + y,
        list(filter(lambda x: x % 2 != 0, lst)))

# or

def odd_sum_alt(lst):
    return sum(list(filter(lambda x: x % 2 != 0, lst)))


num_list = [1,2,1]

print(odd_sum(num_list))
print(odd_sum_alt(num_list))