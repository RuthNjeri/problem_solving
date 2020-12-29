# [1, 2, 3]	6
# require 'pry'
# def product_of_array(arr)
#   return 1 if arr.empty?
#   last = arr[arr.length - 1]
#   arr.pop
# 	return last * product_of_array(arr)
# end


# p product_of_array([1, 2, 3])
def productArr(arr)
  return 1 if arr.empty?
  first = arr[0]
  arr = arr.slice(1, arr.size())
  return first * productArr(arr);
end

# p productArr([1, 2, 3])