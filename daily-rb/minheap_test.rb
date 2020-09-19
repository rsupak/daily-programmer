# require_relative 'node'
# require 'pry'
# require 'byebug'

# node class built specifically for heap tree
# note, :id has been added to node for heap insertion
class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right
  attr_accessor :parent
  attr_accessor :id

  def initialize(title, rating)
    @title = title
    @rating = rating
    @parent = nil
    @id = nil
  end
end

# Min-Heap is a binary-tree data structure in which the root nodes
# for each branch are the smallest comparable of the branch. They
# are a common way for implementing priority queues.
class MinHeap
  attr_reader :root
  attr_reader :count
  attr_reader :row_number

  def initialize(root)
    @root = root
    @root.id = 1
    @count = 1
  end

  # adds new_node to binary-tree
  # insertion is incremented by level in order to build a balanced tree
  # the method does this by assigning each node an id, then locates the
  # potential parent node. parent node must be filled before next parent
  # node is accessed. Level must be filled before next level is access.
  # finally heapify is performed on the new node in order to prioritize
  # the node in the queue.
  def insert(root, new_node)
    new_node.id = @count + 1
    current = find_parent(root, new_node)

    current.left.nil? ? current.left = new_node : current.right = new_node
    new_node.parent = current

    heapify(new_node)
    @count += 1
  end

  # The find method recursively searches the left and right branches
  # until it reaches the terminal leaf or finds and returns the node.
  # O(n) time complexity. Because the nodes can be in any branch as long
  # as it follows the rule that states the root of each branch must be
  # <= each subsequent branch. The entire structure, potentially, must be
  # searched until the node is located.
  # data is rating data
  def find(root, data)
    return root if root.rating == data

    ltree = !root.left.nil? ? find(root.left, data) : nil
    return ltree unless ltree.nil?

    !root.right.nil? ? find(root.right, data) : nil
  end

  # This method creates takes advantage of Ruby's built in
  # Queue class. By pushing the data of the root node to the queue,
  # it allows the method to traverse the tree and output the
  # values of each node to stdout using the puts method
  # dequeue'ing each item until the queue is exhausted.
  def printf
    queue = Queue.new
    queue.enq(@root)
    until queue.empty?
      value = queue.deq
      puts "#{value.title}: #{value.rating}" unless value.title.nil?
      queue.enq(value.left) if value.left
      queue.enq(value.right) if value.right
    end
  end

  def print_sorted
    until @root.nil?
      puts "#{@root.title} : #{@root.rating}"
      remove(@root)
    end
  end

  # deletes node
  # see private method remove()
  def delete(root, data)
    return if data.nil?

    target = find(root, data)
    return if target.nil?

    last_node = find_last(@root, @count)
    target == last_node ? remove_last_node(target) : remove(target)
  end

  private

  # similar to the find method, however method is looking for
  # a specific id rather than a node rating.
  # parent.id will always be equal to target.id / 2
  # data is id data
  def find_parent(root, data)
    return root if root.id == data.id / 2

    ltree = !root.left.nil? ? find_parent(root.left, data) : nil
    return ltree unless ltree.nil?

    !root.right.nil? ? find_parent(root.right, data) : nil
  end

  # parity check for monitoring min-heap root rules.
  # if swap is required, continues swapping nodes with parents
  # until smallest nodes are in branch-root locations.
  def heapify(node)
    parent = node.parent
    left_child = parent.left
    right_child = parent.right
    until node.rating > parent.rating
      if ![left_child, right_child].include?(nil)
        if left_child.rating < right_child.rating
          swap_node(parent, left_child)
        else
          swap_node(parent, right_child)
        end
      else
        swap_node(parent, right_child) if left_child.nil?
        swap_node(parent, left_child) if right_child.nil?
      end
      heapify(parent) unless parent.id == 1
    end
  end

  def swap_node(parent, child)
    parent.rating, child.rating = child.rating, parent.rating
    parent.title, child.title = child.title, parent.title
  end

  # Deletion from a heap is more complex than deletion from a
  # search tree. When a node is removed, heap priority rules must
  # be checked and heapified in order to maintain priority order.
  # This is accomplished by moving the last node from the tree into the
  # place of the removed node, then last node is heapified to sort out
  # proper priority order. Finally, the count must be decrimented to ensure
  # insertion order of a new node.
  def remove(target)
    last_node = find_last(@root, @count)
    swap_node(target, last_node)
    remove_last_node(last_node)
    down_heap(target)
  end

  def down_heap(target)
    return if [target.left, target.right].all?(&:nil?)

    down = if ![target.left, target.right].include?(nil)
             find_smallest_child(target.left, target.right)
           else
             target.left.nil? ? target.right : target.left
           end

    swap_node(target, down) if target.rating > down.rating
    down_heap(down)
  end

  def find_last(node, data)
    return node if node.id == data

    ltree = !node.left.nil? ? find_last(node.left, data) : nil
    return ltree unless ltree.nil?

    !node.right.nil? ? find_last(node.right, data) : nil
  end

  def find_smallest_child(left, right)
    down = left if left.rating < right.rating
    down = right if right.rating < left.rating
    down
  end

  def remove_last_node(target)
    parent = target.parent
    parent.right == target ? parent.right = nil : parent.left = nil
    @count -= 1
  end
end

node0 = Node.new('The Matrix', 87)
root = node0
heap = MinHeap.new(root)

node1 = Node.new('Pacific Rim', 72)
node2 = Node.new('Braveheart', 78)
node3 = Node.new('Star Wars: Return of the Jedi', 80)
node4 = Node.new('Donnie Darko', 85)
node5 = Node.new('Inception', 86)
node6 = Node.new('District 9', 90)
node7 = Node.new('The Shawshank Redemption', 91)
node8 = Node.new('The Martian', 92)
node9 = Node.new('Star Wars: A New Hope', 93)
node10 = Node.new('Star Wars: The Empire Strikes Back', 94)
node11 = Node.new('Mad Max 2: The Road Warrior', 98)

# # Insert Test: left-right child
# heap.insert(root, node4)
# heap.insert(root, node5)
# heap.insert(root, node6)
# heap.insert(root, node2)
# heap.printf

# # Insert Test: right-left child
# heap.insert(root, node9)
# heap.insert(root, node8)
# heap.insert(root, node2)
# heap.insert(root, node5)
# heap.insert(root, node11)
# heap.printf

# # Find Test: left-right
# heap.insert(root, node2)
# heap.insert(root, node4)
# heap.insert(root, node5)
# heap.insert(root, node6)
# puts "Title: #{heap.find(node0, node6.rating).title} | Rating: #{heap.find(node0, node6.rating).rating}"

# # Find Test: right-left
# heap.insert(root, node2)
# heap.insert(root, node5)
# heap.insert(root, node11)
# heap.insert(root, node9)
# heap.insert(root, node8)
# puts "Title: #{heap.find(node0, node8.rating).title} | Rating: #{heap.find(node0, node8.rating).rating}"

# # Delete Test: left-right
# heap.insert(root, node6)
# heap.insert(root, node2)
# heap.insert(root, node4)
# heap.insert(root, node5)
# heap.delete(node0, node5.rating)
# p heap.find(node0, node5.rating)
# puts '**Printing Current Tree**'
# heap.printf

# # Delete Test: right-left
# heap.insert(root, node9)
# heap.insert(root, node8)
# heap.insert(root, node2)
# heap.insert(root, node5)
# heap.insert(root, node11)
# heap.delete(node0, node11.rating)
# p heap.find(node0, node11.rating)
# puts '**Printing Current Tree**'
# heap.printf

# Print Test: Full Tree
# heap.insert(root, node9)
# heap.insert(root, node10)
# heap.insert(root, node3)
# heap.insert(root, node8)
# heap.insert(root, node1)
# heap.insert(root, node5)
# heap.insert(root, node2)
# heap.insert(root, node7)
# heap.insert(root, node6)
# heap.insert(root, node11)
# heap.printf

# # Delete Test: central-node / root-node
# # The Matrix: 87
# # District 9: 90
# # The Shawshank Redemption: 91
# # The Martian: 92
# # Star Wars: A New Hope: 93

heap.insert(root, node6)
heap.insert(root, node7)
heap.insert(root, node8)
heap.insert(root, node9)
# heap.insert(root, node10)
# heap.insert(root, node11)
heap.delete(root, node6.rating)
heap.delete(root, node8.rating)
puts heap.find(root, node6.rating)
# puts "Title: #{heap.root.title} | Rate: #{heap.root.rating} | ID: #{heap.root.id} | P:#{heap.root.parent} | L:#{heap.root.left} | R:#{heap.root.right} | Self: #{heap.root}"
# puts "Title: #{heap.root.left.title} | Rate: #{heap.root.left.rating} | ID: #{heap.root.left.id} | P:#{heap.root.left.parent} | L:#{heap.root.left.left} | R:#{heap.root.left.right} | Self: #{heap.root.left}"
# puts "Title: #{heap.root.right.title} | Rate: #{heap.root.right.rating} | ID: #{heap.root.right.id} | P:#{heap.root.right.parent} | L:#{heap.root.right.left} | R:#{heap.root.right.right} | Self: #{heap.root.right}"
# puts "Title: #{heap.root.left.left.title} | Rate: #{heap.root.left.left.rating} | ID: #{heap.root.left.left.id} | P:#{heap.root.left.left.parent} | L:#{heap.root.left.left.left} | R:#{heap.root.left.left.right} | Self: #{heap.root.left.left}"
# puts "Title: #{heap.root.left.right.title} | Rate: #{heap.root.left.right.rating} | ID: #{heap.root.left.right.id} | P:#{heap.root.left.right.parent} | L:#{heap.root.left.right.left} | R:#{heap.root.left.right.right} | Self: #{heap.root.left.right}"
heap.printf
