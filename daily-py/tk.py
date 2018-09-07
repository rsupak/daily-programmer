from linked_list import Node, Ordered_List

l = [1,2,3,4,5,6,7]
ol = Ordered_List()
for i in l:
    ol.add(i)

print("Forward:")
ol.print_list()

print("Reverse:")
ol.reverse()
ol.print_list()