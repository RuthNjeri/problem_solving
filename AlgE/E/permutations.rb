require 'pry'

def permutations(nums)
  permutations_helper(nums, set = [], answers = [])
  # answers
end

def permutations_helper(nums, set = [], answers = [])
  answers << set if nums.length.zero?


  for i in (0..nums.length - 1)
    new_nums = nums.reject.with_index {|value, idx| idx == i}
    new_set = set + [nums[i]]
    p set
    p new_set
    permutations_helper(new_nums, new_set, answers)
  end
end

p permutations([1,2,3])