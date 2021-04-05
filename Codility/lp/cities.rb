# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

# def solution(t)
#   # write your code in Ruby 2.2

#   result = Array.new(t.length - 1, 0)
#   for node in 0...t.length
#     next if node == t[node] # Skip the city
#     solution_helper(node, t, result, depth = 0)
#   end
#   result
# end

# def solution_helper(node, t, result, depth)
#   if node == t[node] # Arrived at the City
#     result[depth - 1] = result[depth - 1] += 1
#     return
#   end
#   # Process depth of the city
#   depth += 1
#   next_node = t[node]
#   solution_helper(next_node, t, result, depth)
# end

require 'pry'

def solution(t)
  # write your code in Ruby 2.2

  result = Array.new(t.length - 1, 0)
  distances = {}
  for node in 0...t.length
    next if node == t[node] # Skip the city
    distance = solution_helper(node, t, result, depth = 0, distances)
    result[distance - 1] = result[distance - 1] += 1
    distances["#{node}, #{t[node]}"] = distance
  end
  result
end

def solution_helper(node, t, result, depth, distances)
  if !distances["#{node}, #{t[node]}"].nil?
    distance = distances["#{node}, #{t[node]}"]
    depth += distance
    return depth
  end

  if node == t[node] # Arrived at the City
    return depth
  end

  # Process depth of the city
  next_node = t[node]
  depth += 1
  solution_helper(next_node, t, result, depth, distances)
end

p solution([9, 1, 4, 9, 0, 4, 8, 9, 0, 1]) #returns [1, 3, 2, 3, 0, 0, 0, 0, 0]
