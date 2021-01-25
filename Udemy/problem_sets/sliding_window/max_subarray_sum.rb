# def max_subarray_sum(main_arr, length)
#   return 0 if main_arr.length.zero?
#   return 0 if length < 0
#   return 0 if main_arr.length < length

#   pointer_1 = 0
#   max_sum = -Float::INFINITY

#   while pointer_1 < main_arr.length - 1 # O(nm)
#     # add a check for integers in the array
#     sub_array = main_arr.slice(pointer_1, length)
#     current_sum = 0
#     if sub_array.length == length
#       for num in sub_array
#         current_sum += num
#       end
#     end

#     if current_sum > max_sum
#       max_sum = current_sum
#     end

#     pointer_1 += 1
#   end
#   max_sum
# end

# More efficient way

def max_subarray_sum(main_arr, length)
  return 0 if main_arr < length
  
  start_position = 0
  end_position = 0

  max_sum = -Float::INFINITY
  sum = 0


  while end_position < main_arr.length
    sum += main_arr[end_position]
    if end_position >= length - 1
      max_sum = [max_sum, sum].max
      sum -= main_arr[start_position]
      start_position += 1
    end
    end_position += 1
  end

  max_sum == -Float::INFINITY ? 0 : max_sum
end

p max_subarray_sum([100, 200, 300, 400], 2) # 700
p max_subarray_sum([1, 4, 2, 10, 23, 3, 1, 0, 20], 4) # 39
p max_subarray_sum([-3, 4, 0, -2, 6, -1], 2) # 5
p max_subarray_sum([3, -2, 7, -4, 1, -1, 4, -2, 1], 2) # 5
p max_subarray_sum([2, 3], 3) # 0