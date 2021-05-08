
require 'pry'
def max_sub_array_sum(a)
  max_sum = a[0]
  prefix_sum = [0]
  sum = 0

  for num in 0...a.length
    sum += a[num]
    prefix_sum << sum
  end

  for start in 0...a.length # 0..1 (0, 0), (0, 1), (1, 1)
    # p start
    for stop in start...a.length #1, 2 (0, 1, 1)
      # p start , stop
      # binding.pry
      sum = prefix_sum[stop + 1] - prefix_sum[start] # (p[1] - P[0]), (p[2] - P[0]), (p[2] - p[1])
      max_sum = [max_sum, sum].max
    end
  end
  # p a
  # p prefix_sum
  max_sum
end


p max_sub_array_sum([-2,1])
p max_sub_array_sum([5,4,-1,7,8])
p max_sub_array_sum([-1, -2])
p max_sub_array_sum([-2,1,-3,4,-1,2,1,-5,4])