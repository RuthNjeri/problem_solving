def solution(n)
  # write your code in Ruby 2.2
  # check if n is odd or even

  stop = 1
  start = 0
  nums = []
  counter = 1
  while start < n
    if stop > n - 1
      nums[start] = 0
    else
      nums[start] = counter
      nums[stop] = -counter
      counter += 1
    end
    start = stop + 1
    stop = start + 1
  end
  nums
end