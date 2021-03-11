# Input: non-empty string lowercase, non-negative integer(key)
# Output: new string by shifting every letter by k positions in the alphabet

require 'pry'
def caesar_cipher_encryptor(string, key) # xyz
  start = 0
  new_key = key % 26
  while start < string.length
    new_letter = letter_conversion(string[start], new_key).chr
    string[start] = new_letter
    start += 1
  end
  string
end

def letter_conversion(letter, key)
  ascii_value = letter.ord # x y z
  new_ascii_value = ascii_value + key
  largest_ascii = 122
  lowest_ascii = 96

  return new_ascii_value if new_ascii_value <= largest_ascii
  lowest_ascii + new_ascii_value % largest_ascii
end

p caesar_cipher_encryptor("xyz", 2)