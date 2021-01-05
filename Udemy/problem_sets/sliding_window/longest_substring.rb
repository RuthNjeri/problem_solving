require 'pry'
def find_longest_substring(main_string)
  return 0 if main_string.empty?

  start_position = 0
  end_position = 0
  max_len = 0
  character_hash = {}


  while end_position < main_string.length
    letter = main_string[end_position]
    if !character_hash[letter] # distinct character found
      character_hash[letter] = true
      end_position += 1
      max_len = [max_len, character_hash.size].max
    elsif character_hash[letter] # character not distinct
      character_hash.delete(main_string[start_position])
      start_position += 1
    end
  end
  max_len
end

p find_longest_substring('')
p find_longest_substring('rithmschool')
p find_longest_substring('thisisawesome')
p find_longest_substring('thecatinthehat')
p find_longest_substring('bbbbbb')
p find_longest_substring('longestsubstring')
p find_longest_substring('thisishowwedoit')