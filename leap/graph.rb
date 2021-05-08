def solution(n, a, b)
  # write your code in Ruby 2.2
  # Construct adjacency_matrix using 2D array
  # [[],[],[],[]]

  adj_list = {}

  for edge in (0..a.length - 1)
    adj_list[[a[edge], b[edge]]] = true
    adj_list[[b[edge], a[edge]]] = true
  end

  for key in (1..n - 1)
    return false if adj_list[[key, key + 1]].nil?
  end
  true
end

p solution(4, [1, 2, 1, 3], [2, 4, 3, 4])