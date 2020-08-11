# frozen_string_literal: true

require 'pry'
def same(arr1, arr2)
  return false unless arr1.size == arr2.size

  square_table = {}

  arr1.each do |num|
    num_squared = num**2
    if square_table[num_squared]
      square_table[num_squared] += 1
    else
      square_table[num_squared] = 1
    end
  end

  arr2.each do |num|
    break unless square_table[num]

    if square_table[num] == 1
      square_table.delete(num)
    else
      square_table[num] -= 1
    end
  end
  square_table.empty?
end

p same([1, 2, 3, 2], [1, 4, 4, 9])
