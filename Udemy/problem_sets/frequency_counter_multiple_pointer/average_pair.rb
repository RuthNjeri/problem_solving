
require 'pry'

def average_pair(sorted_arr, target_average) # O(n)
  low_counter = 0
  high_counter = sorted_arr.length - 1

  while low_counter != high_counter && sorted_arr.length.positive?
    pair_average = (sorted_arr[low_counter] + sorted_arr[high_counter]) / 2.0

    if pair_average == target_average
      return true
    elsif pair_average > target_average
      high_counter -= 1
    else
      low_counter += 1
    end
  end
  false
end

p average_pair([1, 2, 3], 2.5) # true
p average_pair([1, 3, 3, 5, 6, 7, 10, 12, 19], 8) # true
p average_pair([-1, 0, 3, 4, 5, 6], 4.1) # false
p average_pair([], 4) # false