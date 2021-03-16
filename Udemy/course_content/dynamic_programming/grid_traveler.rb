
def grid_traveler(m, n)
  return 1 if m == 1 && n == 1
  return 0 if m == 0 || n == 0

  grid_traveler(m - 1, n) + grid_traveler(m, n - 1)
end

# p grid_traveler(1, 1)
# p grid_traveler(2, 3)
# p grid_traveler(3, 3)
# p grid_traveler(18, 18)

# Memoize

def grid_traveler(m, n, memo = {})
  # Are the args in the memo
  # Create a unique key by separating m and n,
  # if you concatenate, you might end up with a situation where mn (42, 3) = 423 and (4, 23) = 423 are not unique
  key = "#{m},#{n}"
  # Because (m, n) == (n, m)
  reverse_key = "#{n},#{m}"
  return memo[key] if !memo[key].nil?
  return 1 if m == 1 && n == 1
  return 0 if m == 0 || n == 0

  memo[key] = grid_traveler(m - 1, n, memo) + grid_traveler(m, n - 1, memo)
  memo[reverse_key] = memo[key]
  memo[key]
end

p grid_traveler(2, 3)
p grid_traveler(3, 3)
p grid_traveler(18, 18)