dict_test = {}
dict_test[1] = "hello"
dict_test[2] = "hello2"
dict_test[3] = "hello3"

print(dict_test)
print(dict_test.keys())
print(dict_test.values())
print(dict_test.items())

for key in dict_test.keys():
  print(key)

for value in dict_test.values():
  print(value)

for item in dict_test.items():
  print(item)


test = dict([(1,"hello"), (2, "hello2"), (3, "hello3")])
print(test)
