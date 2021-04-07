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

# def solution(t)
#   # write your code in Ruby 2.2

#   result = Array.new(t.length - 1, 0)
#   distances = {}
#   for node in 0...t.length
#     next if node == t[node] # Skip the city
#     distance = solution_helper(node, t, result, depth = 0, distances)
#     result[distance - 1] = result[distance - 1] += 1
#     distances["#{node}, #{t[node]}"] = distance
#   end
#   result
# end

# def solution_helper(node, t, result, depth, distances)
#   if !distances["#{node}, #{t[node]}"].nil?
#     distance = distances["#{node}, #{t[node]}"]
#     depth += distance
#     return depth
#   end

#   if node == t[node] # Arrived at the City
#     return depth
#   end

#   # Process depth of the city
#   next_node = t[node]
#   depth += 1
#   solution_helper(next_node, t, result, depth, distances)
# end

# BFS
# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(t)
  # write your code in Ruby 2.2

  result = Array.new(t.length - 1, 0)
  adj_list = {}
  distances = {}
  destination = nil

  for city in 0...t.length
    road = t[city]
    if city == road # Skip the city
      destination = city
      next
    end
    if adj_list[road].nil?
      adj_list[road] = [city]
    else
      adj_list[road] << city
    end
  end

  binding.pry

  queue = adj_list[destination] || []

  while !queue.empty?
    city = queue.shift
    # If the distance exists
    # next if !distances["#{city}, #{destination}"].nil?
    # If the city has a direct connection to the city
    if t[city] == destination
      distances["#{city}, #{destination}"] = 1
      result[0] = result[0] += 1

      # Mark children distances
      if !adj_list[city].nil?
        children = adj_list[city].size
        result[1] = result[1] += children
        for child in adj_list[city]
          distances["#{child}, #{destination}"] = 2
          queue << child
        end
      end
    else
      if !adj_list[city].nil?
        # We already have the distances
        total_distance = distances["#{city}, #{destination}"] + 1
        # Mark children distances
        children = adj_list[city].size
        result[total_distance - 1] = result[total_distance - 1] += children
        for child in adj_list[city]
          distances["#{child}, #{destination}"] = total_distance
          queue << child
        end
      end
    end
  end
  result
end



#1.......end              10
          # 0  1 ...                   9 # Cities    0....                    9
p solution([9, 1, 4, 9, 0, 4, 8, 9, 0, 1]) #returns [1, 3, 2, 3, 0, 0, 0, 0, 0]

# 0 - 9
# 1..main city
# ...
# 9 - 1
