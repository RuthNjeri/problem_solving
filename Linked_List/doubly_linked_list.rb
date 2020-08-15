require 'pry'

class Node
  attr_accessor :value, :next_node, :prev_node

  def initialize(value, next_node = nil, prev_node = nil)
    @value = value
    @next_node = next_node
    @prev_node = prev_node
  end
end

class DoublyLinkedList
  attr_accessor :head, :tail, :length
  def initialize()
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
      new_node.prev_node = @tail
      @tail = new_node
    end
    @length += 1
    self
  end

  def pop
    return nil if @head.nil?
    old_tail = @tail
    if @length == 1
      @head = nil
      @tail = nil
    else
      @tail = @tail.prev_node
      old_tail.prev_node = nil
      @tail.next_node = nil
    end
    @length -= 1
    old_tail
  end

  def shift
    return nil if @head.nil?
    old_head = @head
    if @length == 1
      @head = nil
      @tail = nil
    else
      @head = old_head.next_node
      @head.prev_node = nil
      old_head.next_node = nil
    end

    @length -= 1
    old_head
  end

  def unshift(value)
    new_node = Node.new(value)
    if @length == 0
      @head = new_node
      @tail = new_node
    else
      @head.prev_node = new_node
      new_node.next_node = @head
      @head = new_node
    end
    @length += 1
    self
  end

  def get(index)
    return nil if index < 0 || index > @length - 1 || @head.nil?

    mid = @length / 2

    if index > mid
      counter = @length - 1
      current_node = @tail

      while index != counter
        current_node = current_node.prev_node
        counter -= 1
      end
    else
      counter = 0
      current_node = @head

      while index != counter
        current_node = current_node.next_node
        counter += 1
      end
    end
    current_node
  end

  def set(index, value)
    found_node = get(index)

    if !found_node.nil?
      found_node.value = value
      return true
    end
    false
  end

  def insert(index, value)
    return false if index < 0 || index > @length
    return !!unshift(value) if index.zero?
    return !!push(value) if index == @length

    found_node = get(index)
    new_node = Node.new(value)

    unless found_node.nil?
      new_node.next_node = found_node
      new_node.prev_node = found_node.prev_node
      new_node.prev_node.next_node = new_node
      found_node.prev_node = new_node

      @length += 1
      return true
    end
    false
  end

  def remove(index)
    return false if index < 0 || index >= @length
    return shift() if index == 0
    return pop() if index == @length - 1

    remove_node = get(index)
    remove_node.prev_node.next_node = remove_node.next_node
    remove_node.next_node.prev_node = remove_node.prev_node
    remove_node.next_node = nil
    remove_node.prev_node = nil
    @length -= 1
    remove_node
  end
end

list = DoublyLinkedList.new()
 p list
 binding.pry
