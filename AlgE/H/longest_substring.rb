# Redo storing index of letter in hash and updating start index according to last seen

def longest_substring(string)
  hash = {}
  start = 0
  stop = 0
  longest_string = ""

  while stop < string.length
    if hash[string[stop]].nil?
      hash[string[stop]] = true
      stop += 1
    end

    if hash[string[stop]] == true
      current_length = start + stop
      longest_string = string[start...stop] if longest_string.length < current_length
      while hash[string[stop]] == true
        hash.delete(string[start])
        start += 1
      end
    end
  end
  if longest_string.length == 0 && string.length > longest_string.length
    return string
  end
  longest_string
end

p longest_substring("clementisacap")
p longest_substring("abcb")
p longest_substring("a")
p longest_substring("abc")
p longest_substring("abcdeabcdefc")
p longest_substring("abacacacaaabacaaaeaaafa")