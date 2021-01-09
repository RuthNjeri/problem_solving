
# [3, 5, -4, 8, 11, 1, -1, 6], 10
# pointer 0, c_n = 3, comp = 7
# pointer 1, c_n = 5 , comp = 5
# pointer 2, c_n = -4 , comp = 14
# pointer 3, c_n = 8 , comp = 2
# pointer 4, c_n = 11 , comp = -1
# pointer 5, c_n = -1 , comp = -1
# compliments{3: true, 5: true, 14: true, 2: true, -1: true }

# O(n)ST

def two_sum(nums, target)
  compliments = {}
  pointer = 0

  while pointer < nums.length
    current_number = nums[pointer]
    comp = target - current_number
    if compliments[current_number]
      return [current_number, comp]
    else
      compliments[comp] = true
    end
    pointer += 1
  end

  []
end

p two_sum([3, 5, -4, 8, 11, 1, -1, 6], 10)
