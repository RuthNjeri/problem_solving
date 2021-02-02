# Given an array of sorted numbers, remove all duplicates from it. You should not use any extra space;
# after removing the duplicates in-place return the length of the subarray that has no duplicate in it.

# Example 1:
# Input: [2, 3, 3, 3, 6, 9, 9]
# Output: 4
# Explanation: The first four elements after removing the duplicates will be [2, 3, 6, 9].

# Example 2:
# Input: [2, 2, 2, 11]
# Output: 2
# Explanation: The first two elements after removing the duplicates will be [2, 11].

# O(n)T | O(1)S
def remove_duplicates(nums)
  pointer_1 = 0
  pointer_2 = 1

  while pointer_2 < nums.length
    if nums[pointer_1] != nums[pointer_2]
      pointer_1 += 1
      nums[pointer_1] = nums[pointer_2]
    end
    pointer_2 += 1
  end
  pointer_1 + 1
end

p remove_duplicates([2, 3, 3, 3, 6, 9, 9]) # 4
p remove_duplicates([2, 2, 2, 11]) # 2