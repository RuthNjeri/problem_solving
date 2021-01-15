# Funstion, takes in BST and target value
# Returns closest value to the target value

# Recursive
# Average: O(logn)ST
# Worst: O(n)ST
def find_closest_value_in_bst(tree, target)
  find_closest_value_in_bst_helper(tree, target, Float::INFINITY)
end

def find_closest_value_in_bst_helper(tree, target, closest)
  return closest if tree.nil?

  if (target - closest).abs > (target - tree.value).abs
    closest = tree.value
  end

  if target < tree.value
    find_closest_value_in_bst_helper(tree.left, target, closest)
  elsif target > tree.value
    find_closest_value_in_bst_helper(tree.right, target, closest)
  else
    return closest
  end
end


# Iterative
# Average O(log n)T | O(1) S
# Worst O(n) T | O(n) S
def find_closest_value_in_bst(tree, target)
  return find_closest_value_in_bst_helper(tree, target, Float::INFINITY)
end

def find_closest_value_in_bst_helper(tree, target, closest)
  current_node = tree

  while !current_node.nil?
    if (target - closest).abs > (target - current_node.value).abs
      closest = current_node.value
    end
    if target < current_node.value
      current_node = current_node.left
    elsif target > current_node.value
      current_node = current_node.right
    else
      break
    end
  end
  closest
end


# require 'pry'
# wrong
# def find_closest_value_in_bst(tree, target)

#   root_node = tree[:root]

#   current_node = tree[:nodes].select { |node| node[:id] == root_node }.first



#   while !current_node[:left].nil? || !current_node[:right].nil?
#     prev_node = current_node
#     if target > current_node[:value]
#       current_node = tree[:nodes].select { |node| node[:id] ==  current_node[:right] }.first
#     elsif target < current_node[:value]
#       current_node = tree[:nodes].select { |node| node[:id] ==  current_node[:left] }.first
#     else
#       return current_node[:value]
#     end
#   end
#   prev_node[:value]
# end

# tree = {
#         "nodes": [
#           {"id": "10", "left": "5", "right": "15", "value": 10},
#           {"id": "15", "left": "13", "right": "22", "value": 15},
#           {"id": "22", "left": nil, "right": nil, "value": 22},
#           {"id": "13", "left": nil, "right": "14", "value": 13},
#           {"id": "14", "left": nil, "right": nil, "value": 14},
#           {"id": "5", "left": "2", "right": "5-2", "value": 5},
#           {"id": "5-2", "left": nil, "right": nil, "value": 5},
#           {"id": "2", "left": "1", "right": nil, "value": 2},
#           {"id": "1", "left": nil, "right": nil, "value": 1}
#         ],
#         "root": "10"
#       }

# p find_closest_value_in_bst(tree, 12)
