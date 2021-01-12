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

  def breadth_first_search
    data = []
    queue = []
    node = @root
    queue.push(node)

    while !queue.empty?
      node = queue.shift
      data.push(node.value)
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end
    data
  end

  def dfs_preorder #root, left, right
    @queue = []
    traverse_preorder(@root)
    @queue
  end

  def traverse_preorder(current)
    @queue.push(current.value)
    traverse_preorder(current.left) if current.left
    traverse_preorder(current.right) if current.right
  end

  def dfs_postorder # left, right, root
    @queue = []
    traverse_postorder(@root)
    @queue
  end

  def traverse_postorder(current)
    traverse_postorder(current.left) if current.left
    traverse_postorder(current.right) if current.right
    @queue.push(current.value)
  end

  def dfs_inorder #left, root, right
    @queue = []
    traverse_inorder(@root)
    @queue
  end

  def traverse_inorder(current)
    traverse_inorder(current.left) if current.left
    # traverse_inorder(current.left) && current.left
    @queue.push(current.value)
    traverse_inorder(current.right) if current.right
    #  traverse_inorder(current.right) && current.right
  end

  def branch_sum(root)
    sums = []
    branch_sum_helper(root, 0, sums)
    sums
  end

  def branch_sum_helper(node, running_sum, sums)
    return if node.nil?

    new_sum = running_sum + node.value
    sums << new_sum if node.left.nil? && node.right.nil?

    branch_sum_helper(node.left,  new_sum, sums)
    branch_sum_helper(node.right,  new_sum, sums)
  end
end


tree = BinarySearchTree.new()

tree.insert(10)
tree.insert(6)
tree.insert(15)
tree.insert(3)
tree.insert(8)
tree.insert(20)

binding.pry