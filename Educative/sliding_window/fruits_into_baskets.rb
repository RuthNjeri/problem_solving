# Given an array of characters where each character represents a fruit tree,
# you are given two baskets, and your goal is to put maximum number of fruits in each basket.
# The only restriction is that each basket can have only one type of fruit.

# You can start with any tree, but you can’t skip a tree once you have started.
# You will pick one fruit from each tree until you cannot, i.e., you will stop when you have to pick from a third fruit type.

# Write a function to return the maximum number of fruits in both the baskets.

# Example 1:

# Input: Fruit=['A', 'B', 'C', 'A', 'C']
# Output: 3
# Explanation: We can put 2 'C' in one basket and one 'A' in the other from the subarray ['C', 'A', 'C']
# Example 2:

# Input: Fruit=['A', 'B', 'C', 'B', 'B', 'C']
# Output: 5
# Explanation: We can put 3 'B' in one basket and two 'C' in the other basket.
# This can be done if we start with the second letter: ['B', 'C', 'B', 'B', 'C']

# O(n)T, O(1) S
def fruit_baskets(fruits)
  basket = {}
  start = 0
  stop = 0
  sum = 0

  # ['A', 'B'<, 'C', 'B', 'B', 'C'>]
  # {B: 3, C: 2}
  while stop < fruits.length # 0, 1, 2 < 6, 3 < 6, 4 < 6, 5 < 6 #O(n)
    fruit = fruits[stop] # A, B, C, B, B, C
    if basket[fruit].nil? && basket.length < 2
      basket[fruit] = 1 # {A: 1, B: 1}
    elsif basket[fruit] # B, C
      basket[fruit] += 1 #{B: 3, C: 2}
    else
      first_bucket = fruits[start] # fruits[0] A
      basket.delete(first_bucket) # {B: 1}
      basket[fruit] = 1 # {B: 1, C: 1}
      start += 1 # 1
    end
    stop += 1 # 1, 2, 3, 4, 5, 6
  end

  basket.map do |key, value| # O(n)
    sum += value
  end
  sum
end


p fruit_baskets(['A', 'B', 'C', 'B', 'B', 'C']) # 5
p fruit_baskets(['A', 'B', 'C', 'A', 'C']) # 3