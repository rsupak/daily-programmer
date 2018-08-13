num_list = [5, 2, 9, 1, 1, 9, 4, 8, 3, 6, 1]
width = len(num_list)

def list_to_dict(lst):
    d = dict()
    for i in range(len(lst)):
        d[i] = lst[i:]
    return d
        
    
def iter_d(num_d):
    d_len = len(num_d)
    temp_d = dict()
    d_copy = num_d.copy()
    for k in num_d.keys():
        temp_d = dict()
        if num_d[k][:len(num_d[k])-1]:
            temp_d[d_len] = num_d[k][:len(num_d[k])-1]
        d_len += 1
        d_copy.update(temp_d)
    num_d.update(d_copy)
    return num_d

init_d = list_to_dict(num_list)
# print(init_d)
print(iter_d(init_d))