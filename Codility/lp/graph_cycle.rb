# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

require 'pry'
def solution(a, b)
  # write your code in Ruby 2.2
  adj_list = {}
  visited = {}
  visited_nodes = 0
  stack = [1]


  for item in (0..a.length - 1)
    node = a[item]
    if adj_list[node].nil?
      adj_list[node] = [b[item]]
    else
       adj_list[node] << b[item]
    end
  end

  while !stack.empty?
    current_node = stack.pop
    return true if visited[current_node] && visited_nodes == a.length
    if visited[current_node].nil? && !adj_list[current_node].nil?
      visited[current_node] = true
      visited_nodes += 1
      for neighbor in adj_list[current_node]
          stack << neighbor
      end
    end
  end
  false
end


def solution(a, b)
  # write your code in Ruby 2.2
  adj_list = {}
  visited = {}
  visited_nodes = 0
  start_node = 1
  stack = [start_node]


  for item in (0...a.length)
    node = a[item]
    if adj_list[node].nil?
      adj_list[node] = [b[item]]
    else
      return false
    end
  end


  while !stack.empty?
    current_node = stack.pop
    if visited[current_node]
      break
    end
    visited[current_node] = true
    visited_nodes += 1
    if !adj_list[current_node].nil?
      for node in adj_list[current_node]
        stack << node
      end
    end
  end
  current_node == start_node && visited_nodes == a.length ? true : false
end


# Tests
# Failing at small_corner_cases
# p solution([1, 2, 1], [3, 2, 2]) #false
p solution([1, 2, 2, 3, 3] ,[2, 3, 3, 4, 5]) #false
# Check the above if a node is not present in A then it is not a cycle
# p solution([1, 2, 3, 4], [2, 1, 4, 4]) #false
# p solution([1, 2, 1], [2, 3, 3]) #false
# p solution([3, 1, 2], [2, 3, 1]) #true
# p solution([3, 1, 2], [2, 3, 1]) #true
# p solution([1, 2, 3, 4], [2, 1, 4, 4]) #false
# p solution([1, 2, 3, 4], [2, 1, 4, 3]) #false
# p solution([1, 2], [1, 2]) #false
# p solution([1, 3, 2, 4], [4, 1, 3, 2]) #true
# p solution([5, 3, 1, 2, 4], [4, 5, 5, 1, 2]) #false

# {5=>[4], 3=>[5], 1=>[5], 2=>[1], 4=>[2]} false

# A= [1, 3, 2, 4] B = [4, 1, 3, 2]
# aj_list = {}
# Loop through A.length
  # A[0] = 1
  # aj_list[A[0]] = []
    # aj_list[A[0]] << B[0]


    # ad_list = {
      # 1: [4]
      # 2: [3]
      # 3: []
      # 4: [2]
    # }
  # Visited = {1: true, 4: true, 2: true, 3: true}
  # Current_path = {1: true, 4: false, 2: false, 3: false }
    # loop through the ad_list
    # 1
  #  A= [1, 2, 3, 4] B = [2, 1, 4, 3]
    # ad_list = {
      # 1: [2]
      # 2: [1]
      # 3: [4]
      # 4: [3]
    # }
# for node, children in adj_list
#   return true if visited[node] && current_path[node]
#   visited[node] = true
#   current_path[node] = true
#   for child in children

#   end
# end
# print visited
# print current_path
# print current_node