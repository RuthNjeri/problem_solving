# Input: non-empty string
# Output: boolean (is_palindome?)

# Examples: abcdcba


def is_palindrome(string) # a b c d c b a, m u m s, e a a e
  left = 0
  right = string.length - 1

  while left <= right # 0 != 6, 1 != 5, 2 != 4, 3 != 3
    return false if string[left] != string[right]
    if string[left] == string[right]
      left += 1
      right -= 1
    end
  end

  return true if left > right
  false
end

p is_palindrome("abcdcba")
p is_palindrome("mums")
p is_palindrome("eaae")