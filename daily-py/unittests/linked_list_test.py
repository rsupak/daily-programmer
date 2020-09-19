from io import StringIO
import sys
import unittest

class TestSolution(unittest.TestCase):
    def setUp(self):
        self.n1 = Node("Rob")
        self.n2 = Node("Ben")
        self.n3 = Node("Mike")
        self.n4 = Node("Ken")
        self.l_list = LinkedList()

    def add_to_tail(self):
        self.l_list.add_to_tail(self.n1)
        self.assertEqual(self.l_list.tail, self.n1)
        self.l_list.add_to_tail(self.n2)
        self.assertEqual(self.l_list.tail, self.n2)

    def remove_tail(self):
        self.l_list.add_to_tail(self.n1)
        self.l_list.add_to_tail(self.n2)
        self.assertEqual(self.l_list.tail, self.n2)
        self.l_list.remove_tail()
        self.assertEqual(self.l_list.tail, self.n1)
        self.l_list.remove_tail()
        self.assertEqual(self.l_list.tail, None)

    def print(self):
        self.l_list.add_to_tail(self.n1)
        self.l_list.add_to_tail(self.n2)

        if not hasattr(sys.stdout, "getvalue"):
            self.fail("need to run in buffered mode")
        self.assertEqual(StringIO.getvalue(), "Rob\nBen\n")

    def remove_from_head(self):
        self.l_list.add_to_tail(self.n1)
        self.l_list.add_to_tail(self.n2)
        self.l_list.add_to_tail(self.n3)

        self.l_list.delete(self.n1)
        self.assertEqual(self.l_list.head, self.n2)
        self.assertEqual(self.l_list.head.next, self.n3)
        self.assertEqual(self.l_list.tail, self.n3)
    
    def remove_from_middle(self):
        self.l_list.add_to_tail(self.n1)
        self.l_list.add_to_tail(self.n2)
        self.l_list.add_to_tail(self.n3)

        self.l_list.delete(self.n2)
        self.assertEqual(self.l_list.head, self.n1)
        self.assertEqual(self.l_list.head.next, self.n3)
        self.assertEqual(self.l_list.tail, self.n3)

    def delete_unknown(self):
        self.l_list.add_to_tail(self.n1)
        self.l_list.add_to_tail(self.n2)
        self.l_list.add_to_tail(self.n3)

        self.assertIsNone(self.l_list.delete(self.n4))
    
    def remove_from_end(self):
        self.l_list.add_to_tail(self.n1)
        self.l_list.add_to_tail(self.n2)
        self.l_list.add_to_tail(self.n3)

        self.l_list.delete(self.n3)
        self.assertEqual(self.l_list.head, self.n1)
        self.assertEqual(self.l_list.head.next, self.n2)
        self.assertEqual(self.l_list.tail, self.n2)

    def add_to_front(self):
        self.l_list.add_to_front(self.n1)
        self.assertEqual(self.l_list.head, self.n1)
        self.l_list.add_to_head(self.n2)
        self.assertEqual(self.l_list.head, self.n2)

    def remove_from_front(self):
        self.l_list.add_to_front(self.n1)
        self.assertEqual(self.l_list.head, self.n1)
        self.l_list.add_to_head(self.n2)
        self.assertEqual(self.l_list.head, self.n2)
        self.l_list.remove_front()
        self.assertEqual(self.l_list.head, self.n1)
        self.l_list.remove_front()
        self.assertEqual(self.l_list.head, None)

    def find(self):
        self.l_list.add_to_front(self.n1)
        self.l_list.add_to_front(self.n2)
        self.l_list.add_to_front(self.n3)
        self.assertEqual(self.l_list.find(1), self.n2)

    def remove_at(self):
        self.l_list.add_to_front(self.n1)
        self.l_list.add_to_front(self.n2)
        self.l_list.add_to_front(self.n3)
        self.l_list.remove_at(1)
        self.assertEqual(self.l_list.find(1), self.n1)


if __name__ == '__main__':
    unittest.main(module = __name__, buffer = True, exit = False, verbosity=2)
