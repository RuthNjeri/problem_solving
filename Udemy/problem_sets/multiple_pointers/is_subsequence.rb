# Takes in two strings,
# Checks whether the characters in the first string
# Form a subsequence of characters in the second string

def is_subsequence(string_1, string_2)

  pointer_1 = 0
  pointer_2 = 0

  # Validation

  return false if string_2.length < string_1.length
  return false if string_1.length.zero? || string_2.length.zero?
  return false if string_1.class != String || string_2.class != String

  while pointer_2 < string_2.length
    if string_1[pointer_1] == string_2[pointer_2]
      pointer_1 += 1
    end
    pointer_2 += 1

    return true if pointer_1 == string_1.length
  end

  false
end

p is_subsequence("hello", "hello world") # true
p is_subsequence("sing", "sting") # true
p is_subsequence("abc", "abracadabra") # true
p is_subsequence("abc", "acb") # false
