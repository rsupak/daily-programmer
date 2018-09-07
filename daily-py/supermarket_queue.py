cust = [2,3,10]
stations = 2
queues = []

def sub_one(x): return x - 1

while stations > 0:
    queues.append(cust.pop(0))
    stations -= 1

while 0 not in queues:
    print(queues)
    list(map((lambda x: x-1), queues))
    # queues[0] -= 1

# print(cust)
# print(queues)
# print(stations)