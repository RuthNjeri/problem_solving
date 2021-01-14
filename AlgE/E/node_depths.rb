def node_depths(tree)
  node_depths_helper(tree.root, 0)
end

def node_depths_helper(node, depth)
  return 0 if node.nil?
  depth += 1

  left_sum = node_depths_helper(node.left, depth)
  right_sum = node_depths_helper(node.right, depth)

  depth + left_sum + right_sum
end