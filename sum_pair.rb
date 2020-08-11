# require 'set'
require 'pry'

# def sum_pair(input_array, target_sum)
#     comp = Set.new()
#     output = Array.new()
#     if input_array
#         for num in input_array
#             if comp.include?(num)
#                 return output.push(num, target_sum - num)
#             else
#                 comp.add(target_sum - num)
#             end
#         end
#     end
#     return []
# end

# puts sum_pair([1], 10)

# Linear

# def sum_pair(input_array, target_sum)
#     for i in (0..input_array.length - 1)
#         first_num = input_array[i]
#         for j in (i+1..input_array.length - 1)
#             second_num = input_array[j]
#             if first_num + second_num == target_sum
#                 return [first_num, second_num]
#             end
#         end
#     end
#     return []

# end

# p sum_pair([1, 9, 8, 2], 10)

#  Sort

# def sum_pair_sort(input_array, target_sum)
#     input_array.sort!
#     lower_pointer = 0
#     higher_pointer = input_array.length - 1
#     for num in 0..input_array.length - 1
#         lower_number = input_array[lower_pointer]
#         higher_number = input_array[higher_pointer]
#         if lower_number < higher_number
#             if  lower_number + higher_number == target_sum
#                 return [lower_number, higher_number ]
#             elsif lower_number + higher_number > target_sum
#                 higher_pointer -= 1
#             elsif lower_number + higher_number < target_sum
#                 lower_pointer += 1
#             end
#         end
#     end
#     return []
# end

# With While Loop since num is not being used above

# def sum_pair_sort_with_while(input_array, target_sum)
#     input_array.sort!
#     lower_pointer = 0
#     higher_pointer = input_array.length - 1

#     while lower_pointer < higher_pointer
#         if input_array[lower_pointer] + input_array[higher_pointer] == target_sum
#             return[input_array[lower_pointer], input_array[higher_pointer]]
#         elsif input_array[lower_pointer] + input_array[higher_pointer] > target_sum
#             higher_pointer -= 1
#         elsif input_array[lower_pointer] + input_array[higher_pointer] < target_sum
#             lower_pointer -= 1
#         end
#     end
#     []
# end

# p sum_pair_sort([3, 5, -4, 8, 11, 1, -1, 6], 10)
# p sum_pair_sort_with_while([1, 9, 8, 2], 10)

def two_sum(array, target_sum)
	array.sort!
	low_pointer = 0
	high_pointer = array.length - 1

	while low_pointer < high_pointer
		current_sum = array[low_pointer] + array[high_pointer]
		if current_sum == target_sum
			return [array[low_pointer], array[high_pointer]]
		elsif current_sum < target_sum
			low_pointer += 1
		elsif current_sum > target_sum
			high_pointer -= 1
		end
	end
[]
end

def two_sum(array, target_sum)
    for num in 0..array.length - 1
        for second_num in num + 1..array.length - 1
            current_sum = array[num] + array[second_num]
            if current_sum == target_sum
                return [array[num] , array[second_num]]
            end
        end
    end
[]
end


p two_sum([3, 5, -4, 8, 0, 11, -1, 6], 10)


def two_sum(nums, target)
    dict = {}
    nums.each_with_index do |n, i|
      if dict[target - n]
        return dict[target - n], i
      end
      dict[n] = i
    end
end

two_sum([5,5,4,8], 9)