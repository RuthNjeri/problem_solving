require 'pry'

# Recursive
# O(2^n)T
# O(n)S
# def nth_fib(n)
#   return 0 if n == 1
#   return 1 if n == 2

#   nth_fib(n-1) + nth_fib(n-2)
# end

# O(n)ST
# def nth_fib(n, memoize = {1 => 0, 2 => 1})
#   return memoize[n] if memoize[n]

#   memoize[n] = nth_fib(n - 1, memoize) + nth_fib(n - 2 , memoize)
# end



# Iterative solution
# O(n)T, O(n) S
def nth_fib(n)
  prev_two = [0, 1]

  return prev_two[0] if n == 1
  return prev_two[1] if n == 2
  n -= 2

  while !n.zero?
    current_sum = prev_two[0] + prev_two[1]
    prev_two[0] = prev_two[1]
    prev_two[1] = current_sum
    n -= 1
  end
  prev_two.pop
end

# Iterative solution

# def nth_fib(n)
#   prev_two = [0, 1]

#   return prev_two[0] if n == 1
#   return prev_two[1] if n == 2

#   counter = 3

#   while counter <= n
#     current_sum = prev_two[0] + prev_two[1]
#     prev_two[0] = prev_two[1]
#     prev_two[1] = current_sum
#     counter += 1
#   end
#   prev_two.pop
# end

p nth_fib(2) # 1
p nth_fib(1) # 0
p nth_fib(6) # 5