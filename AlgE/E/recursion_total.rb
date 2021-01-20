def total(n, sum = 0)
  return sum if n <= 0
  sum += n
  total(n - 1, sum)
end

# def total(n)
#   sum = 0
#   sum += n
#   return 0 if n <= 0
#   sum += total(n - 1)
# end

p total(6)