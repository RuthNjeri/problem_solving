# Given an array of positive numbers and a positive number ‘S,’ find the length of the smallest contiguous subarray whose sum is greater than or equal to ‘S’. Return 0 if no such subarray exists.

# Example 1:
# Input: [2, 1, 5, 2, 3, 2], S=7
# Output: 2
# Explanation: The smallest subarray with a sum great than or equal to '7' is [5, 2].

# Example 2:
# Input: [2, 1, 5, 2, 8], S=7
# Output: 1
# Explanation: The smallest subarray with a sum greater than or equal to '7' is [8].

# Example 3:
# Input: [3, 4, 1, 1, 6], S=8
# Output: 3
# Explanation: Smallest subarrays with a sum greater than or equal to '8' are [3, 4, 1] or [1, 1, 6].

# O(1)S, O(n)T
def smallest_subarray(nums, s)
  min_length = Float::INFINITY

  start_position = 0
  end_position = 0

  sum = nums[start_position]

  while start_position < nums.length
    if sum < s
      end_position += 1
      break if end_position == nums.length

      sum += nums[end_position]
    elsif sum >= s
      size = nums[start_position..end_position].size
      min_length = [min_length, size].min
      sum -= nums[start_position]
      start_position += 1
    end
  end
  min_length
end

p smallest_subarray([2, 1, 5, 2, 3, 2] , 7) # 2
p smallest_subarray([2, 1, 5, 2, 8], 7) # 1
p smallest_subarray([3, 4, 1, 1, 6], 8) # 3