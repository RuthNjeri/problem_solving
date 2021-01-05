# Return minimal length of a contiguous subarray
# in which the sum is greater than or equal to the
# integer passed to the function

def min_sub_array_len(nums, sum)
  total = 0
  start_position = 0
  end_position = 0
  min_len = Float::INFINITY

  while start_position < nums.length
    if total < sum && end_position < nums.length
      total += nums[end_position]
      end_position += 1
    elsif total >= sum
      min_len = [min_len, end_position - start_position].min
      total -= nums[start_position]
      start_position += 1
    else
      break
    end
  end
  min_len == Float::INFINITY ? 0 : min_len
end


p min_sub_array_len([2, 3, 1, 2, 4, 3], 7)
p min_sub_array_len([2, 1, 6, 5, 4], 9)
p min_sub_array_len([3, 1, 7, 11, 2, 9, 8, 21, 62, 33, 19], 52)
p min_sub_array_len([1, 4, 16, 22, 5, 7, 8, 9, 10], 39)
p min_sub_array_len([1, 4, 16, 22, 5, 7, 8, 9, 10], 55)
p min_sub_array_len([4, 3, 3, 8, 1, 2, 3], 11)
p min_sub_array_len([1, 4, 16, 22, 5, 7, 8, 9, 10], 95)
