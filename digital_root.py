def get_root(num):
    temp_num = num // 10 + num % 10
    if temp_num >= 10:
        return get_root(temp_num)
    return temp_num

print(get_root(1))
print(get_root(22))
print(get_root(158))