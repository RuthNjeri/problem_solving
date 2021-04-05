require 'pry'
def solution(a)
  # write your code in Ruby 2.2
  max_depth = 0
  p = 0 # start
  r = 2 # end

  while r < a.length
    q = p + 1
    if a[p] > a[q] && a[q] < a[r] # P > Q < R strictly increasing and strictly decreasing
      r_moving_depth = move_r(max_depth, p, q, r, a)
      q_r_moving_depth = move_q_r(max_depth, p, q, r, a)
      moving_depth = [r_moving_depth, q_r_moving_depth].max
      max_depth = [max_depth, moving_depth].max
    end
    p += 1
    r += 1
  end
  max_depth
end

def move_r(max_depth, p, q, r, a)
  depth = [(a[p] - a[q]), (a[r] - a[q])].min
  max_depth = [max_depth, depth].max
  r += 1
  while r < a.length
    if a[p] > a[q] && a[q] < a[r]
      # binding.pry
      depth = [(a[p] - a[q]), (a[r] - a[q])].min
      max_depth = [max_depth, depth].max
    end
    r += 1
  end
  max_depth
end

def move_q_r(max_depth, p, q, r, a)
  depth = [(a[p] - a[q]), (a[r] - a[q])].min
  max_depth = [max_depth, depth].max
  q += 1
  r = q + 1
  binding.pry
  while r < a.length && a[p..q].length == 3
    if a[p] > a[q] && a[q] < a[r]
      binding.pry
      depth = [(a[p] - a[q]), (a[r] - a[q])].min
      max_depth = [max_depth, depth].max
    end
    q += 1
    r += 1
  end
  max_depth
end

p solution([0, 1, 3, -2, 0, 1, 0, -3, 2, 3])