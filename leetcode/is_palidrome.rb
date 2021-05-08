# Given a string s, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

# Example 1:
# Input: s = "A man, a plan, a canal: Panama"
# Output: true
# Explanation: "amanaplanacanalpanama" is a palindrome.

def is_palindrome(s)

  valid_string = ""

  for char in 0...s.length
      if s[char].match?(/[A-Za-z0-9]/)
          valid_string << s[char].downcase
      end
  end

  start = 0
  stop = valid_string.length - 1
  while start < stop
      return false if valid_string[start] != valid_string[stop]
      start += 1
      stop -= 1
  end
  true
end