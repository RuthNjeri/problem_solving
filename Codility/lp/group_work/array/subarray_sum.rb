require 'pry'

def subarray_sum(nums, k)
  start = 0
  stop = 0
  count = 0
  current_sum = 0

  while stop < nums.length
    current_sum += nums[stop]
    if current_sum == k
      count += 1
      current_sum -= nums[start]
      start += 1
    end
    stop += 1
  end
  count += 1 if nums.last == k && nums.length > 1
  count
end

# p subarray_sum([1, 1, 1], 2)
p subarray_sum([1, 2, 3], 3)
p subarray_sum([1], 0)
# p subarray_sum([2, 2, 2], 2)
