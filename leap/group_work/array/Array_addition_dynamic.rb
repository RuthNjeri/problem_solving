
# Have the function ArrayAddition(arr) take the array of numbers stored in arr and return True if any combination
# of numbers in the array(excluding the largest number) can be added up to equal the largest number in the array,
# Otherwise return False.

# For example: If arr contains [4, 6, 23, 10, 1, 3] the output should return True because 4 + 6 + 10 + 3 = 23

# The array will not be empty, will not contain all the same elements and may contain negative numbers.

# Examples:

# Input: [5, 7, 16, 1, 2]
# Output: False

# Input: [3, 5, -1, 8, 12]
# Output: True

require 'pry'

def array_addition(arr)
  arr.sort!
  n = arr.length

  dynamic_addition(arr, n - 2, 0)
end

def dynamic_addition(arr, n, sum)

  return true if sum == arr.last
  return false if n < 0


  include_num = dynamic_addition(arr, n - 1, arr[n] + sum)
  exclude_num = dynamic_addition(arr, n - 1, sum)

  include_num || exclude_num

end

p array_addition([3, 5, -1, 8, 12])
p array_addition([1, 4, 5, 5, 9])
p array_addition([5, 7, 16, 1, 2])
