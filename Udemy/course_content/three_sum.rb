def three_number_sum(input_array, target_sum)
	seen = Set.new
	combination = Array.new

    input_array.each_with_index do |value, index|
            pair_sum = target_sum - value
            combination << find_pair(pair_sum, input_array, index).sort
    end
    combination.reject(&:empty?).sort
end

# Sort first

# def find_pair(target_sum, input_array, third_num_index)
#     comp = Set.new()
#     output = Array.new()
#     new_array = input_array[third_num_index + 1 .. -1]
#     if new_array
#         for num in new_array
#             if comp.include?(num)
#                 return output.push(num, target_sum - num, input_array[third_num_index])
#             else
#                 comp.add(target_sum - num)
#             end
#         end
#     end
#     return []
# end

# p three_number_sum([12, 3, 1, 2, -6, 5, -8, 6], 0)


# def three_sum_sort(input_array, target_sum)
#     input_array.sort!
#     three_sum_combination = []

#     for num in 0..input_array.length - 1
#         current = input_array[num]
#         left_num = num + 1
#         right_num = input_array.length - 1

#         while left_num < right_num
#             if input_array[left_num] + input_array[right_num] + current == target_sum
#                 three_sum_combination << [current, input_array[left_num], input_array[right_num]].sort
#                 left_num += 1
#                 right_num -= 1
#             elsif input_array[left_num] + input_array[right_num] + current > target_sum
#                 right_num -= 1
#             elsif input_array[left_num] + input_array[right_num] + current < target_sum
#                 left_num += 1
#             end
#         end
#     end
#     return  three_sum_combination.sort
# end

# p three_sum_sort([12, -11, -1, 2, -1, -1, -8, 6], 0)
