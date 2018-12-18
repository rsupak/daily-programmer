require_relative 'node'

class MinHeap
  attr_accessor :heap_array, :root

  def initialize(root)
    @heap_array = [root]
    @root = heap_array.first
  end

  def parent(index)
    index / 2
  end

  def left_child(index)
    2 * index + 1
  end

  def right_child(index)
    2 * index + 2
  end

  def left_child_key(index)
    heap_array[left_child(index)]
  end

  def right_child_key(index)
    heap_array[right_child(index)]
  end

  def parent_key(index)
    heap_array[parent(index)]
  end

  def insert(node)
    heap_array << node
    add_links
    heapify
  end

  def printf
    heap_array.each { |node| puts node }
  end

  def add_links
    heap_array.map.with_index do |node, i|
      node.left = left_child_key(i)
      node.right = right_child_key(i)
      node.parent = parent_child_index(i) unless node = root
    end
  end

  def heapify
    swapped = true
    until swapped == false
      swapped = false
      heap_array.each.with_index do |node, i|
        left = heap_array.index(node.left)
        unless node.left.nil?
          if node.rating > node.left.rating
            heap_array[i], heap_array[left] = heap_array[left], heap_array[i]
            swapped = true
          end
        end
        add_links
      end
    end
  end
end

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

heap = MinHeap.new(node0)
# heap.insert(node1)
# heap.insert(node2)
# heap.insert(node3)
# heap.insert(node4)

# heap.printf

# # Insert Test: left-right child
heap.insert(node4)
heap.insert(node5)
heap.insert(node6)
heap.insert(node2)
heap.printf
