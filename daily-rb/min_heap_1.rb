class Node
  attr_accessor :title, :rating, :left, :right

  def initialize(title, rating)
    @title = title
    @rating = rating
  end

  def to_s
    "#{@title}: #{@rating}"
  end
end

class MinHeap
  attr_accessor :heap, :root

  def initialize(root)
    @heap = [root]
    @root = heap.first
  end

  def insert(_root, node)
    heap << node
    reload
    heapify
  end

  def delete(root, data)
    return if data.nil?

    remove = heap.index(find(root, data))
    last = heap.size - 1
    heap[remove], heap[last] = heap[last], heap[remove]
    heap.pop
    reload
    heapify
  end

  def find(_root, data)
    index = heap.find_index { |x| x if x.rating == data }
    heap[index]
  end

  def printf
    heap.each do |node|
      puts node.to_s
    end
  end

  def left_child(index)
    2 * index + 1
  end

  def right_child(index)
    2 * index + 2
  end

  def left_child_key(index)
    heap[left_child(index)]
  end

  def right_child_key(index)
    heap[right_child(index)]
  end

  def leaf_node?(index)
    index >= heap_size / 2
  end

  def satisfied?(index)
    heap[index] <= left_child_key(index) &&
      heap[index] <= right_child_key(index)
  end

  def reload
    heap.map.with_index do |node, i|
      node.left = left_child_key(i)
      node.right = right_child_key(i)
    end
  end

  def heapify
    swapped = true
    until swapped == false
      swapped = false
      heap.each.with_index do |node, i|
        left = heap.index(node.left)
        unless node.left.nil?
          if node.rating > node.left.rating
            heap[i], heap[left] = heap[left], heap[i]
            swapped = true
          end
        end
        reload
      end
    end
  end
end

# Node initializations
node0 = Node.new('The Matrix', 87)
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

# Min Heap object
root = node0
heap_test = MinHeap.new(root)

# # Insert Test: left-right child
heap_test.insert(root, node4)
heap_test.insert(root, node5)
heap_test.insert(root, node6)
heap_test.insert(root, node2)
# heap_test.delete(root, node2.rating)
heap_test.printf

# Insert Test: right-left child
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
# heap.insert(root, node6)
# heap.insert(root, node7)
# heap.insert(root, node8)
# heap.insert(root, node9)
# heap.insert(root, node10)
# heap.insert(root, node11)
# heap.delete(root, node0.rating)
# heap.delete(root, node6.rating)
# heap.delete(root, node7.rating)
# heap.delete(root, node8.rating)
# heap.delete(root, node9.rating)
# puts "Title: #{heap.root.title} | Rate: #{heap.root.rating} | ID: #{heap.root.id} | P:#{heap.root.parent} | L:#{heap.root.left} | R:#{heap.root.right} | Self: #{heap.root}"
# puts "Title: #{heap.root.left.title} | Rate: #{heap.root.left.rating} | ID: #{heap.root.left.id} | P:#{heap.root.left.parent} | L:#{heap.root.left.left} | R:#{heap.root.left.right} | Self: #{heap.root.left}"
# puts "Title: #{heap.root.right.title} | Rate: #{heap.root.right.rating} | ID: #{heap.root.right.id} | P:#{heap.root.right.parent} | L:#{heap.root.right.left} | R:#{heap.root.right.right} | Self: #{heap.root.right}"
# puts "Title: #{heap.root.left.left.title} | Rate: #{heap.root.left.left.rating} | ID: #{heap.root.left.left.id} | P:#{heap.root.left.left.parent} | L:#{heap.root.left.left.left} | R:#{heap.root.left.left.right} | Self: #{heap.root.left.left}"
# puts "Title: #{heap.root.left.right.title} | Rate: #{heap.root.left.right.rating} | ID: #{heap.root.left.right.id} | P:#{heap.root.left.right.parent} | L:#{heap.root.left.right.left} | R:#{heap.root.left.right.right} | Self: #{heap.root.left.right}"
# puts ""
# puts "Search for node after Delete: #{heap.find(root, node6.rating)}"
# heap.printf





# heap_test.insert(node0, node3)
# heap_test.insert(node0, node2)
# heap_test.insert(node0, node1)
# heap_test.reload
# heap_test.heap.each do |node|
#   puts node.to_s
# end
# heap_test.heapify
# puts ''
# heap_test.heap.each do |node|
#   puts node.to_s
# end
# heap_test.printf
# puts heap_test.root.to_s
# puts heap_test.root.left.to_s
# puts heap_test.root.right.to_s
# puts heap_test.root.left.left.to_s

