# frozen_string_literal: true

require 'pry'

class Node
  attr_accessor :next_node, :value
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# first = Node.new("hi")
# first.next_node = Node.new("test")

# p first

class SinglyLinkedList
  attr_accessor :head, :tail, :length
  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  def push(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = @head
    else
      @tail.next_node = new_node
      @tail = new_node
    end
    @length += 1
    self
  end

  def pop
    return nil if @length.zero?

    current = @head
    new_tail = current

    while current.next_node
      new_tail = current
      current = current.next_node
    end
    @tail = new_tail
    @tail.next_node = nil
    @length -= 1
    if @length == 0
      @head = nil
      @tail = nil
    end
    current
  end

  def shift
    return nil if @length == 0

    shift_node = @head
    @head = @head.next_node
    @length -= 1
    @tail = nil if @length == 0
    shift_node
  end

  def unshift(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
      @tail = @head
    else
      new_node.next_node = @head
      @head = new_node
    end
    @length += 1
    self
  end

  def get(position)
    return nil if position < 0 || position > @length

    current = @head
    counter = 0

    while counter != position
      current = current.next_node
      counter += 1
    end
    current
  end

  def set(index, value)
    current_node = get(index)
    if current_node
      current_node.value = value
      return true
    end
    false
  end

  def insert(index, value)
    if index < 0 || index > @length
      return false
    elsif index == 0
      unshift(value)
    elsif index == @length
      push(value)
    else
      new_node = Node.new(value)
      prev_node = get(index - 1)
      new_node.next_node = prev_node.next_node
      prev_node.next_node = new_node
      @length += 1
    end
    true
  end

  def remove(index)
    return nil if index < 0 || index >= @length
    return pop if index == @length - 1
    return shift if index == 0

    prev_node = get(index - 1)
    removed = prev_node.next_node
    prev_node.next_node = removed.next_node
    @length -= 1
    removed
  end

  def reverse
    node = @head
    @head = @tail
    @tail = node
    prev_node = nil
    next_node = nil

    node_counter = 0
    while  node_counter < @length
        next_node = node.next_node
        node.next_node = prev_node
        prev_node = node
        node = next_node
        node_counter += 1
    end
    self
  end

  def reverse_
    node = @head
    @head = @tail
    @tail = @head
    prev_node = nil
    next_node = nil

    while !node.nil?
      binding.pry
      next_node = node.next_node
      node.next_node = prev_node
      prev_node = node
      node = next_node
    end
    self
  end
end

list = SinglyLinkedList.new
list.push(2)
list.push(3)
list.push(4)

# p list
p list.reverse_

# binding.pry
