from collections import Counter

def majority(lst):
    majority_num = 0
    enumerated_dict = dict(Counter(lst))
    for key in enumerated_dict:
        if enumerated_dict[key] > majority_num:
            majority_key_list = []
            majority_num = enumerated_dict[key]
            majority_key_list.append(key)
        elif enumerated_dict[key] >= majority_num:
            majority_key_list.append(key)
    if len(majority_key_list) > 1:
        return -1
    else:
        return majority_key_list[0]

lst = [1,5,2,2,3,4,5]
print(majority(lst))