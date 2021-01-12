
# O(n) time | O(n) space
def branch_sum(root)
  sums = []

  branch_sum_helper(root, 0, sums) #1.(10, 0, [])

  sums
end

def branch_sum_helper(node, running_sum, sums) #1.(10, 0, []) 2. (6, 10, []) 3. (3, 16, [])
  return if node.nil?

  new_sum = running_sum + node.value # 1. 0 + 10 # 2. 10 + 6 # 3. 16 + 3
  sums << new_sum if node.left.nil? && node.right.nil? # 19

  branch_sum_helper(node.left,  new_sum, sums) # (6, 10, []) #(3, 16, []) #(nil, 19, [19])
  branch_sum_helper(node.right,  new_sum, sums) # #(8, 16, []) (15, 10, []) #(nil, 19, [19])
end

# Stack
#(nil, 19, [19])..pop
#(nil, 19, [19])..pop
#(3, 16, [19])..pop
#(nil, 19, [19, 24])..pop
#(nil, 19, [19, 24])..pop
# (8, 16, [])..pop
# (6, 10, [])..pop
# (nil, 25, [])..pop
# (20, 25, [19, 24, 45])..pop
# (15, 25, [])..pop
# (15, 10, [])..pop
# (10, 0, [19, 24, 45])


# wrong
# def branch_sum(tree)
#   sum = 0
#   sum_list = []

#   sum_list << branch_sum_helper(tree.left, sum)
#   sum_list << branch_sum_helper(tree.right, sum)
# end

# def branch_sum_helper(node, sum)
#   return sum if node.nil?
#   sum += node.value
#   branch_sum_helper(node.left, sum)
# end

# def branch_sum(tree)
#   sum_list = []
#   current_node = tree.root

#   while current_node
#     left_node = current_node.left
#     while left_node
#       sum += left_node.value
#       prev_node = left_node
#       left_node = left_node.left
#       if left_node.nil?
#         sum_list << sum
#         current_node = prev_node
#         sum -= prev_node.value
#       end
#     end

#     right_node = current_node.right
#     while right_node
#       sum += right_node.value
#       if right_node.left?
#       end
#       right_node = right_node.right
#       if right_node.nil?
#         sum_list << sum
#       end
#     end
#   end
# end