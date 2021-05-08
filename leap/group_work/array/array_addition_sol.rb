# From Coderbyte https://github.com/ratracegrad/coderbyte-Beginner/blob/master/Array%20Addition%20I

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
require 'pry'

# def array_addition(arr)
#   arr.sort!

#   largest = arr.pop
#   total = 0

#   for num in 0...arr.length
#     total += arr[num]

#     # Add forward
#     for second_num in num + 1...arr.length
#       total += arr[second_num]
#       return true if total == largest
#     end

#     # Subtract forward
#     for third_num in num + 1...arr.length
#       total -= arr[third_num]
#       return true if total == largest
#     end

#     total = 0
#   end

#   false
# end



p array_addition([4, 6, 23, 10, 1, 3]) # true
# [1, 3|, 4|, 6|, 10|]
p array_addition([5, 7, 16, 1, 2]) # false
p array_addition([3, 9, 5, -1, 8, 12]) # true
p array_addition([1, 2, 3, 4]) # true