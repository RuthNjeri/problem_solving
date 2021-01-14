
# In a graph, a vertex is a node
# Edges are the connections

# O(V + E)T...traverse through each node(V) and their children(E)
# O(V) S...adding frames to the callstack...can have V frames on the call stack..the array is also O(V)
def dfs(graph, array)
  result = array
  dfs_helper(graph.root, result)
  result
end

def dfs_helper(node, result)
  # return if node.nil?

  result << node.name
  for child in node.children
    dfs_helper(child, result)
  end
end


def dfs(graph, array)
  array << graph.name
  for child in node.children
    dfs(child, array)
  end
  array
end


# iterative
# def dfs(graph, array)
#   node = graph.root
#   array << node

#   for child in node.children
#     array << child.name
#     for child in child.children

#     end
#   end
# end