require 'pry'

# Recursion solution O(2^n)
def fibonacci_recur(position)
  return 1 if position == 1 || position == 2

  fibonacci(position - 1) + fibonacci(position - 2)
end

# Dynamic solution
# Need Overlapping Subproblem and Optimal Substructure
# Remember and store answers to previous subproblems
# Memoization: Store results of expensive function calls
# and return the cached result when the same inputs occur again

def fibonacci_memo(position, memo = [0, 1, 1])
  return memo[position] unless memo[position].nil?

  result = fibonacci(position - 1, memo) + fibonacci(position - 2, memo)
  memo[position] = result

  result
end

# DP using Tabulation
