require 'pry'
# O(log n)T
# 0(1)S
# def binary_search(arr, target)
#   high = arr.length - 1
#   low = 0

#   while low <= high
#     mid = (high + low) / 2
#     if target < arr[mid]
#       high = mid - 1
#     elsif target > arr[mid]
#       low = mid + 1
#     else
#       return mid
#     end
#   end

#   -1
# end

# Recursion
# O(log(n))ST

def binary_search(arr, target)
  binary_search_helper(arr, target, 0, arr.length - 1)
end

def binary_search_helper(arr, target, low, high)
  mid = (low + high)/2
  if target < arr[mid]
    high = mid - 1
    binary_search_helper(arr, target, low, high)
  elsif target > arr[mid]
    low = mid + 1
    binary_search_helper(arr, target, low, high)
  else
    return mid
  end
end

p binary_search([0, 1, 21, 33, 45, 45, 61, 71, 72, 73], 33)