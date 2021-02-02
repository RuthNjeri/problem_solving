# Reads the same forwards and backwords
# Returns true if a string is a palindrome
# isPalindrome('awesome') // false
# isPalindrome('foobar') // false
# isPalindrome('tacocat') // true
# isPalindrome('amanaplanacanalpanama') // true
# isPalindrome('amanaplanacanalpandemonium') // false


def is_palindrome(string)
  return true if string.length == 1

  last_string = string.length - 1
  return false if string[0] != string[last_string]

  is_palindrome(string.slice(1, last_string - 1))
end

p is_palindrome('tacocat') # true
p is_palindrome('amanaplanacanalpanama') # true
p is_palindrome('awesome') # false
p is_palindrome('foobar') # false
p is_palindrome('amanaplanacanalpandemonium') # false