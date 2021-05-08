# Have the function ArrayAddition(arr) take the array of numbers stored in arr and return True if any combination
# of numbers in the array(excluding the largest number) can be added up to equal the largest number in the array,
# Otherwise return False.
# For example: If arr contains [4, 6, 23, 10, 1, 3] the output should return True because  4 + 6 + 10 + 3 = 23
# The array will not be empty, will not contain all the same elements and may contain negative numbers.

# Examples:
# Input: [5, 7, 16, 1, 2]
# Output: False
# Input: [3, 5, -1, 8, 12]
# Output: True

# Uses dynamic programming
def array_addition(arr)
  # Loop through the array to get the largest item
  largest_num = 0
  sum = 0
  for num in arr
    if num > largest_num
      largest_num = num
    end
    sum += num
  end
  # Find the total minus the largest sum
  sum -= largest_num
  # If the result of the total so far minus the largest sum exists return true
  difference = sum - largest_num

  for num in arr
    next if num == largest_num
    return true if num == difference
  end

  false
end



# p array_addition([4, 6, 23, 10, 1, 3]) # true 47 - 23 = 24, 24 - 23, 1
# p array_addition([5, 7, 16, 1, 2]) # false
p array_addition([3, 9, 5, -1, 8, 12]) # true, 12, 24 - 12 12 [-1, 3, 5, 8, 9], 12]... 12 [-1, 2, 7, 15, 24] # go back to the original array?
# # total = 15 , largest = 12, 3
# p array_addition([1, 2, 3, 4]) # true