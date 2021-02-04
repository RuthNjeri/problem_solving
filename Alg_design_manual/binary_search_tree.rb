# Binary tree nodes have a right and left pointer.
# Optional parent pointer and data field
# You can add a third pointer for duplicate items, or a counter.

class Node
  attr_accessor :value, :right, :left
  def initialize(value)
    @value = value # data item
    @right = nil # pointer to the right child
    @left = nil # pointer to the left child
  end
end

# Basic operations supported, searching, traversal, insertion, and deletion
require 'pry'
class BST
  attr_accessor :root
  def initialize(root = nil)
    @root = root
  end

  # search using recursion
  # O(h)T, h = height of the tree
  def search(value)
    return 'not found' if @root.nil?
    return 'found' if @root.value == value

    if value < @root.value
      @root = root.left
      search(value)
    elsif value > @root.value
      @root = root.right
      search(value)
    end
  end

  # Minimum and maximum values in a tree
  # All minimum values are in the left side of the tree
  # All maximum values are in the right side of the tree
  # def find_minimum
  #   return @root.value if @root.left.nil?
  #   @root = @root.left
  #   find_minimum()
  # end

  # Iteration
  def find_minimum
    current = @root

    while current.left && !current.nil?
      current = current.left
      return current.value if current.left.nil?
    end
  end

  # Tree traversal
  # BST traversal can list all nodes in sorted order
  # in-order traversal
  # visit all left nodes, then the root, then the right nodes
  # O(n) nodes in the tree
  def inorder
    @queue = []
    inorder_traversal(@root)
    @queue
  end

  def inorder_traversal(node)
    inorder_traversal(node.left) if node.left
    @queue << node.value
    inorder_traversal(node.right) if node.right
  end

  # O(h)T height of the tree
  def insertion(value)
    insertion_recursion(value, @root)
  end

  def insertion_recursion(value, tree)
    if value < tree.value
      if tree.left.nil?
        tree.left = Node.new(value)
        return
      end
      insertion_recursion(value, tree.left)
    else
      if tree.right.nil?
        tree.right = Node.new(value)
        return
      end
      insertion_recursion(value, tree.right)
    end
  end
end

root = Node.new(8)
root.right = Node.new(15)
root.right.right = Node.new(16)
root.right.left = Node.new(14)
root.left = Node.new(1)
root.left.left = Node.new(0)
root.left.right = Node.new(2)

bst = BST.new(root)
bst2 = BST.new(root)
bst3 = BST.new(root)
bst4 = BST.new(root)

# Recursion was alterring the original root node
# Used two different objects to access the methods
# alternatively, pass in the tree in the methods
p bst.find_minimum
p bst2.search(2)
p bst3.inorder

p bst4.insertion(3)
binding.pry
