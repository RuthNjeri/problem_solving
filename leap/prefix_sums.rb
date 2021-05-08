
require 'pry'

def prefix_sums(a)
  n = a.length
  p = [0] * (n + 1)

  for k in (1..p.length - 1)
    p[k] = p[k-1] + a[k - 1]
  end
  p
end

p prefix_sums([1, 2, 3])

# Total of one slice

def count_total(p, x, y)
  p[y + 1] - p[x]
end

p count_total([1, 2, 3], 1, 1)