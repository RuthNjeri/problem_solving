# Given an array of positive numbers and a positive number ‘k,’ find the maximum sum of any contiguous subarray of size ‘k’.

# Example 1:
# Input: [2, 1, 5, 1, 3, 2], k=3
# Output: 9
# Explanation: Subarray with maximum sum is [5, 1, 3].

# Example 2:
# Input: [2, 3, 4, 1, 5], k=2
# Output: 7
# Explanation: Subarray with maximum sum is [3, 4].

# Bruteforce O(n^2)T, 0(1)S
# Iterative O(n)T O(1)S..sliding window

def max_subarray_sum(nums, k)
  max_sum = -Float::INFINITY
  sum = 0
  start_position = 0
  end_position = 0

  while end_position < nums.length # 0 < 6, 1 < 6, 2 < 6, 3 < 6, 4 < 6, 5 < 6
    sum += nums[end_position] # 0 += 2 (2), 2 += 1 (3), 3 += 5 (8), 6 += 1 (7), 6 += 3 (9), 4 += 2 (6)
    if end_position >= (k - 1)  # 0 >= 2, 1 >= 2, 2 >= 2, 3 >= 2, 4 >= 3, 5 >= 3
      max_sum = [max_sum, sum].max # [- inf, 8] (8), [8, 7] (8), [8, 9] (9), [9, 6] (9)
      sum -= nums[start_position] # 8 -= 2 (6), 7 -= 1 (6), 9 -= 5 (4), 9 -= 1 (8)
      start_position += 1 # 1, 2, 3, 4
    end
    end_position += 1 # 1, 2, 3, 4, 5, 6
  end

  max_sum == -Float::INFINITY ? 0 : max_sum # 9
end

p max_subarray_sum([2, 1, 5, 1, 3, 2], 3) # 9
p max_subarray_sum([2, 3, 4, 1, 5], 2) # 7