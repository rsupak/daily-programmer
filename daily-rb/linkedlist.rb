require 'byebug'

class Node
  attr_accessor :value, :next
  def initialize(value = nil)
    @value = value
    @next = nil
  end

  def to_s
    @value.to_s
  end
end

class LinkedList
  attr_accessor :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def <<(node)
    @tail.next = node unless @tail.nil?
    @tail = node
    @head = node if @head.nil?
  end

  def remove(value_to_remove)
    # debugger
    previous_node = @head
    current_node = @head
    until current_node.nil?
      if current_node.value == value_to_remove
        if current_node == @head
          @head = @head.next
          current_node = @head
        else
          previous_node.next = current_node.next
        end
      end
      previous_node = previous_node.next
      current_node = current_node.next
    end
  end

  def to_s
    output = ''
    current_node = @head
    until current_node.next.nil?
      output << current_node.to_s + ' ~> '
      current_node = current_node.next
    end
    output << current_node.to_s
  end
end

list = LinkedList.new
arr = [4,4,6,3,4,2,7,4,3,5,6,6,3,4,4,3,2]
arr.each do |num|
  list << Node.new(num)
end
puts list
list.remove(4)
puts list
