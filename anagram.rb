# frozen_string_literal: true

require 'pry'
def valid_anagram(original, anagram)
  return false unless original.size == anagram.size

  char_frequency = {}
  original.split('').each do |char|
    if char_frequency[char]
      char_frequency[char] += 1
    else
      char_frequency[char] = 1
    end
  end

  anagram.split('').each do |char|
    return false if char_frequency[char].to_i.zero?

    char_frequency[char] -= 1
  end
  true
end

p valid_anagram('yyv', 'yyy')
