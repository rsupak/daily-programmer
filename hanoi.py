class Stack:
     def __init__(self):
         self.items = []

     def isEmpty(self):
         return self.items == []

     def push(self, item):
         self.items.append(item)

     def pop(self):
         return self.items.pop()

     def peek(self):
         return self.items[len(self.items)-1]

     def size(self):
         return len(self.items)

# fills Tower A with initial input
def initialize_towers(arr):
    A = Stack()
    B = Stack()
    C = Stack()

    for num in arr[::-1]:
        A.push(num)

    return A,B,C

arr = [1,2,3]

tower_a, tower_b, tower_c = initialize_towers(arr)

while tower_a.size != 0 and tower_b.size != 0:
    if tower_a.peek() < tower_b.peek() and 