# Given an array of integers nums and an integer k, return the total number of continuous subarrays whose sum equals to k.

# Example 1:

# Input: nums = [1,1,1], k = 2
# Output: 2
# Example 2:

# Input: nums = [1,2,3], k = 3
# Output: 2

# Input: nums = [9, -9, 8, 1], k = 9
# Output: 3

def subarray_sum(nums, k)

  hash = {0 => 1}
  sum = 0
  count = 0

  for num in nums
      sum += num
      count += hash[sum - k] if !hash[sum -k].nil?
      hash[sum] ||= 0
      hash[sum] += 1
  end
  count
end