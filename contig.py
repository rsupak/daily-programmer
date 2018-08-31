num_list = [2, -8, 3, -2, 4, -10]

def sum_list(lst):
    sums = sum(lst)    
    for i in range(len(lst)):
        # shortens list sample from the left
        temp_list = lst[i:].copy()
        for j in range(len(temp_list)):
            # shortens list sample from the right
            temp_sum = sum(temp_list[:len(temp_list)-j])
            if temp_sum > sums:
                sums = temp_sum
        
    return sums

print(sum_list(num_list))