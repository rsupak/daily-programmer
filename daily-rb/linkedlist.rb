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
    previous_node = nil
    current_node = @head
    until current_node.nil?
      if current_node.value == value_to_remove
        if current_node == @head
          @head = current_node.next
        elsif previous_node.nil?
        else
          previous_node = current_node.next
        end
        current_node = current_node.next
      end
      previous_node = current_node
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
arr = [6, 2, 3, 4, 5, 6, 4, 3, 6, 6, 2]
arr.each do |num|
  list << Node.new(num)
end
puts list
list.remove(6)
puts list
