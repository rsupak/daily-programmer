list_1 = [1, 2, 3, 4, 5]
list_2 = [1, 2, 3, 4, 5, 6]

set_1 = set(list_1)
set_2 = set(list_2)

def find_difference(set1, set2):
    temp_list = []
    if len(set1) > len(set2):
        temp_list = list(set1 - set2)
    else:
        temp_list = list(set2 - set1)
    return temp_list
    

for item in find_difference(set_1, set_2):
    print(item)