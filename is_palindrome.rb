# frozen_string_literal: true

# def palindrome?(string) #O(n)T, #O(1)S
#   string_array = string.split('')
#   left_pointer = 0
#   right_pointer = string_array.length - 1

#   if left_pointer == right_pointer
#     return true
#   end

#   while left_pointer < right_pointer
#     return false if string_array[left_pointer] != string_array[right_pointer]

#     left_pointer += 1
#     right_pointer -= 1
#   end
#   true
# end

# def palindrome?(string) # O(n)S, O(n^2) due to string concatenation, under the hood for immutable strings the program has to copy the entire string again
#   reversed_string = ''

#   (0..string.length - 1).reverse_each do |i| #O(n)
#     reversed_string += string[i] #O(n)
#   end
#   string == reversed_string
# end

# def palindrome?(string) # O(n)ST
#   reversed_arr = []

#   (0..string.length - 1).reverse_each do |i|
#     reversed_arr << string[i]
#   end
#   string == reversed_arr.join
# end

# Recursion

def palindrome?(string, left_index = 0) #O(n)ST #O(n)S because of the recursive call stack, some programs have tail functions which would be 0(1) space
  right_index = string.length - 1 - i

  if left_index >= right_index
    return true
  else
    string[left_index] == string[right_index] && palindrome?(string, i + 1)
  end
end

p palindrome? 'miwkm'

# lp 0 1 2
# rp 3 2 1
