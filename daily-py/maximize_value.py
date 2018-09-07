from itertools import permutations

def maximize_value(values, weights, max_weight):
    test_list = []
    
    # create dict of weights to values
    weights_values_dict = dict(zip(weights, values))

    # find permutations of keys <= 10
    for item in list(permutations(weights, 2)): 
        if sum(item) <= max_weight:
            test_list.append(item)
    
    # sum the values of the weights that add to 10 and return max value
    max_sum = 0
    for item in test_list:
        num_1 = weights_values_dict[item[0]]
        num_2 = weights_values_dict[item[1]]
        max_sum = num_1 + num_2 if num_1 + num_2 >= max_sum else max_sum

    return max_sum


values = [20, 5, 10, 40, 15, 25]
weights = [1, 2, 3, 8, 7, 4]
print(maximize_value(values, weights, 10))