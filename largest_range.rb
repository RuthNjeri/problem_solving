# frozen_string_literal: true

require 'pry'

def largest_range(array)
  hash_table = {}
  longest_range = 0
  longest_array = []

  array.each do |num|
    hash_table[num] = true
  end

  array.each do |num|
    next unless hash_table[num]

    hash_table[num] = false
    current_range = 1
    left_num = num - 1
    right_num = num + 1
    while hash_table.include? left_num
      hash_table[left_num] = false
      current_range += 1
      left_num -= 1
    end

    while hash_table.include? right_num
      hash_table[right_num] = false
      current_range += 1
      right_num += 1
    end

    next unless current_range > longest_range

    longest_range = current_range
    longest_array = [left_num + 1, right_num - 1] # The left_num and right_num will not
    # be present because they broke out of the while loop. +1 , and -1 gives the correct numbers
  end
  longest_array
end

# p largest_range([-1, 1, -3, 0, 15, -5, -2, -4, 10, -7, 12, -6])

# Learnt
# Can loop a while loop by checking if a number is present in an array
# Next: Do the longer version

# def largest_range(array)
#     array.sort!
#     # [0, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 15]
#   start_index = 0
#   current_index = 0
#     largest_length = 0
#     largest_range = []
#   while current_index < array.length
#     if array[current_index] + 1 == array[current_index + 1]
#       current_index += 1
#         else
#             # binding.pry
#             current_length = (start_index..current_index).size
#             if current_length > largest_length
#                 largest_length = current_length
#                 if current_index > start_index
#                     largest_range << array[start_index]
#                     largest_range << array[current_index]
#                 else
#                     largest_range << array[start_index]
#                 end
#             else
#                 start_index = current_index + 1
#                 current_index += 1
#             end
#     end
#     end
#     largest_length
# end

# def longest_consecutive(array)
#   array.sort!.uniq!
#   start_index = 0
#   curr_index = 0
#     largest_length = 0

#   while curr_index < array.length
#     if array[curr_index] + 1 == array[curr_index + 1]
#       curr_index += 1
#         else
#       current_length = (start_index..curr_index).size
#       if current_length > largest_length
#         largest_length = current_length
#       else
#         start_index = curr_index + 1
#         curr_index += 1
#       end
#     end
#   end
#   largest_length
# end
# p longest_consecutive([1,2,0,1])
