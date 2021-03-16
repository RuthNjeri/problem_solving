require 'pry'

# Recursion solution O(2^n)
def fibonacci_recur(position)
  return 1 if position <= 2

  fibonacci(position - 1) + fibonacci(position - 2)
end

# Dynamic solution
# Need Overlapping Subproblem and Optimal Substructure
# Remember and store answers to previous subproblems
# Memoization(Top-Down): Store results of expensive function calls
# and return the cached result when the same inputs occur again

def fibonacci_memo(position, memo = [0, 1, 1])
  return memo[position] unless memo[position].nil?

  result = fibonacci(position - 1, memo) + fibonacci(position - 2, memo)
  memo[position] = result

  result
end

# DP using Tabulation(Bottom Up)
# Better space complexity

# Space and time complexity of O(n)
def fibonacci_table(position)
  return 1 if position == 1 || position == 2

  fib_table = [0, 1, 1]

  (3..position).map do |index|
    fib_table[index] = fib_table[index - 1] + fib_table[index - 2]
  end

  fib_table[position]
end

# Space complexity O(1), time complexity 0(n)

def fibonacci_table_2(position)
  return 1 if position == 1 || position == 2

  prev_1 = 1
  prev_2 = 1

  (3..position).map do |index|
    result = prev_1 + prev_2

    prev_1 = prev_2
    prev_2 = result
  end

  prev_2
end

