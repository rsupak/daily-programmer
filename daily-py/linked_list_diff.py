class Node:
    def __init__(self, init_data):
        self.data = init_data
        self.next = None
    
    def get_data(self):
        return self.data
    
    def get_next(self):
        return self.next
    
    def set_data(self, new_data):
        self.data = new_data

    def set_next(self, next_data):
        self.next = next_data

    def __str__(self):
        return str(self.data)

    def __int__(self):
        return int(self.data)

class Unordered_List:
    def __init__(self):
        self.head = None

    def is_empty(self):
        return self.head == None

    def add(self, item):
        current = self.head
        previous = None
        stop = False
        while current != None and not stop:
            if current.get_data() > item:
                stop = True
            else:
                previous = current
                current = current.get_next()

        temp = Node(item)
        if previous == None:
            temp.set_next(self.head)
            self.head = temp
        else:
            temp.set_next(current)
            previous.set_next(temp)
        

    def size(self):
        current = self.head
        count = 0
        while current:
            count += 1
            current = current.get_next()
        return count

    def search(self, item):
        current = self.head
        found = False
        while current and not found:
            if current.get_data() == item:
                found = True
            else:
                current = current.get_next()
        return found
    
    def remove(self, item):
        current = self.head
        previous = None
        self.search(item)
        if previous == None:
            self.head = current.get_next()
        else:
            previous.set_next(current.get_next())

    def print_list(self):
        current = self.head
        while current:
            print(current.data)
            current = current.get_next()

    def sum_nums(self):
        current = self.head
        temp_sum = 0
        while current:
            temp_sum += current.data
            current = current.get_next()
        return temp_sum
    

def find_diff(list1, list2):
    sum_1 = list1.sum_nums()
    sum_2 = list2.sum_nums()

    size_1 = list1.size()
    size_2 = list2.size()

    diff = abs(sum_1 - sum_2)

    if size_1 > size_2:
        if list1.search(diff):
            return diff
        else:
            pass

    elif size_2 > size_1:
        if list2.search(diff):
            return diff
        else:
            pass

    else:
        return diff # building exception cases
    