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

  def find_closest_value(tree, target)
    current_node = tree.root
    closest_value = current_node.value

    while current_node
      if ( target - current_node.value ) < ( target - closest_value )
        closest_value = current_node.value
      end

      if target < current_node.value
        current_node = current_node.left
      elsif target > current_node.value
        current_node = current_node.right
      else
        break
      end
    end
    closest_value
  end

  def node_depths(tree)
    node_depths_helper(tree.root, 0)
  end

  def node_depths_helper(node, depth)
    return 0 if node.nil?

    left_sum = node_depths_helper(node.left, depth + 1)
    right_sum = node_depths_helper(node.right, depth + 1)

    depth + left_sum + right_sum
  end

# Algo-Expert
#   def find_closest_value_in_bst(tree, target)
#     return find_closest_value_in_bst_helper(tree, target, Float::INFINITY)
#   end

#   def find_closest_value_in_bst_helper(tree, target, closest)
#     current_node = tree.root
#     while !current_node.nil?
#       if (target - closest).abs > (target - current_node.value).abs
#         closest = current_node.value
#       end
#       if target < current_node.value
#         current_node = current_node.left
#       elsif target > current_node.value
#         current_node = current_node.right
#       else
#         break
#       end
#     end
#     closest
#   end
end


tree = BinarySearchTree.new()
tree.insert(10)
tree.insert(9)
tree.insert(15)
tree.insert(2)


# tree.root = Node.new(10)
# tree.root.right = Node.new(20)
# tree.root.left = Node.new(7)
# tree.root.left.right = Node.new(8)

binding.pry