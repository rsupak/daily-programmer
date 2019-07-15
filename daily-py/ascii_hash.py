from functools import reduce
TEST = "Hello"

string_list = list(TEST)

hash = reduce((lambda x, y: x + y), list(map(lambda x : ord(x), string_list))) % 6

print(hash)
