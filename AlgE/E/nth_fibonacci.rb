# Recursive

# def nth_fib(n)
#   return 0 if n == 1
#   return 1 if n == 2 || n == 3

#   nth_fib(n-1) + nth_fib(n-2)
# end



# Iterative solution

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

p nth_fib(2) # 1
p nth_fib(1) # 0
p nth_fib(6) # 5