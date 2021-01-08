
def recursive_range(num)
  return 0 if num.zero?

  num + recursive_range(num - 1)
end

p recursive_range(6) # 6 + 5 + 4...0