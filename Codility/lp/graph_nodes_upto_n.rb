def solution(n, a, b)
  # write your code in Ruby 2.2
  distances = {}
  for node in 0...a.length
    distances["#{a[node]}, #{b[node]}"] = true
    distances["#{b[node]}, #{a[node]}"] = true
  end

  for node in 1...n
    next_node = node + 1
    if distances["#{node}, #{next_node}"].nil?
      return false
    end
  end
  true
end