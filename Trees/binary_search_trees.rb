require 'pry'

class Node
  attr_accessor :value, :right, :left
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value)
    new_node = Node.new(value)
    if @root.nil?
      @root = new_node
      return self
    else
      current = @root
      while true
        return nil if value == current.value
        if value < current.value
          if current.left.nil?
            current.left = new_node
            return self
          end
            current = current.left
        elsif  value > current.value
            if current.right.nil?
              current.right = new_node
              return self
            end
             current = current.right
        end
      end
    end
  end

  def find(value)
    return false if @root.nil?

    return true if @root.value == value

    current = @root
    found = false

    while current && !found
      if value > current.value
        current = current.right
      elsif value < current.value
        current = current.left
      else
        found = true
      end
    end
    return false unless found

    current
  end
end


tree = BinarySearchTree.new()
tree.insert(10)
tree.insert(5)
tree.insert(13)
tree.insert(11)
tree.insert(2)
tree.insert(16)
tree.insert(7)
# tree.root = Node.new(10)
# tree.root.right = Node.new(20)
# tree.root.left = Node.new(7)
# tree.root.left.right = Node.new(8)

binding.pry