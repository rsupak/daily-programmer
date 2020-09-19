class Node
  attr_accessor :value, :left, :right, :index, :previous
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
    @previous = nil
    @index = nil
  end
end

class Tree
  def initialize
    @head = nil
    @base = nil
    @index = 0
    @peaks = []
  end

  def add(node)
    node.index = @index
    @index += 1
    if @head.nil?
      @head = node
      @base = @head
    elsif node.value > @base.value
      @base.right = node
      @base.previous
      @base = @base.right
    else
      @peaks << @base.index
      @base.left = node
    end
  end

  def highest_index
    highest = current.index
    until current.right.nil?
      highest = current.value > current.right.value ? highest : current.right.index
      current = current.right
    end
    highest
  end

  def peak_indices
    current = @head
    
  end

  def to_s
    print 'Peaks are located at the following indices: '
    current = @head.right
    @peaks.each { |p| print " #{p}" }
    puts
    print "Highest Peak is located at index #{highest}"
  end
end

arr = [0, 1, 3, 1, 2, 0]
mount = Tree.new
arr.each do |v|
  n = Node.new(v)
  mount.add(n)
end
puts mount.to_s
