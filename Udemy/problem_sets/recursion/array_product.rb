
def product_of_array(nums)
  return 1 if nums.length.zero?

  nums[0] * product_of_array(nums.slice(1, nums.length))
end

p product_of_array([1,2,3, 10])