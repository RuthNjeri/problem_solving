
# Given a sorted array, create a new array containing squares of all the numbers of the input array in the sorted order.

# Example 1:

# Input: [-2, -1, 0, 2, 3]
# Output: [0, 1, 4, 4, 9]
# Example 2:

# Input: [-3, -1, 0, 1, 2]
# Output: [0, 1, 1, 4, 9]

# O(n)S | O(n)T
def sorted_square(nums)
  left = 0
  right = nums.length - 1
  square = []

  square_idx = nums.length - 1

  while left <= right
    right_square = nums[right] * nums[right]
    left_square = nums[left] * nums[left]

    if right_square > left_square
      square[square_idx] = right_square
      right -= 1
    else
      square[square_idx] = left_square
      left += 1
    end
    square_idx -= 1
  end
  square
end

p sorted_square( [-2, -1, 0, 2, 3]) # [0, 1, 4, 4, 9]
p sorted_square( [-3, -1, 0, 1, 2]) # [0, 1, 1, 4, 9]