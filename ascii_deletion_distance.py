# def ascii_deletion_distance(str1, str2):
#     str1 = set(str1)
#     str2 = set(str2)
#     if len(str1) > len(str2):
#         temp_set = str1 ^ str2
#     else:
#         temp_set = str2 ^ str1
#     print(temp_set)
#     temp_sum = 0
#     for item in list(temp_set):
#         temp_sum += ord(item)
#     return temp_sum

def fun(str1, str2):
    str1 = list(str1)
    str2 = list(str2)
    temp_str = set(str1) ^ set(str2)

    d = dict()
    count = 0
    for char in str1:
        if char in temp_str:
            if char not in d.keys():
                d[char] = 1
            else:
                d[char] += 1
    for char in str2:
        if char in temp_str:
            if char not in d.keys():
                d[char] = 1
            else:
                d[char] += 1

    ascii_sum = 0
    for k,v in d.items():
        ascii_sum += ord(k) * v

    return ascii_sum

str1 = 'bat'
str2 = 'goat'


# print(ascii_deletion_distance(str1, str2))
print(fun(str1, str2))