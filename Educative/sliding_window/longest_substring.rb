# Given a string with lowercase letters only, if you are allowed to replace no more than ‘k’ letters with any letter,
# find the length of the longest substring having the same letters after replacement.

# Example 1:

# Input: String="aabccbb", k=2
# Output: 5
# Explanation: Replace the two 'c' with 'b' to have a longest repeating substring "bbbbb".
# Example 2:

# Input: String="abbcb", k=1
# Output: 4
# Explanation: Replace the 'c' with 'b' to have a longest repeating substring "bbbb".
# Example 3:

# Input: String="abccde", k=1
# Output: 3
# Explanation: Replace the 'b' or 'd' with 'c' to have the longest repeating substring "ccc".

require 'pry'
def longest_substring(string, k)
  max_length = 0
  start = 0
  stop = 0
  count = 0
  

  while stop < string.length #"aab>ccbb>"
    if string[stop] !=  string[start] && count < k # 0 < 2 , 1 < 2
      count += 1 # 1, 2
    elsif string[stop] !=  string[start] && count >= k # 2 == 2
      count = 0
      start += 1
      stop = start + 1
    end
    max_length = [max_length, (string[start..stop].size)].max # 5
    # binding.pry
    stop += 1
  end
  max_length
end

p longest_substring("aabccbb", 2) # 5
p longest_substring("abbcb", 1) # 4
p longest_substring("AABABBA", 1) # 3

# Redo!