
require 'pry'
class Node
  attr_accessor :value, :next_node
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_accessor :first, :last, :length
  def initialize
    @first = nil
    @last = nil
    @length = 0
  end

  def pop # It is actually shift
    return nil if @first.nil?

    removed_node = @first
    if @first == @last
      @last = nil
    end
    @first = @first.next_node
    @length -= 1
    removed_node.value
  end

  def push(value) #It is actually unshift
    new_node = Node.new(value)
    if @first.nil?
      @first = new_node
      @last = new_node
    else
      new_node.next_node = @first
      @first = new_node
    end
    @length += 1
  end
end

list = Stack.new()
binding.pry