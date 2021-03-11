# Input: non-empty string
# Output: run-length encoding

# run-length-encoding is a form of lossless data compression
# runs of data are stored as a single data value and count rather than the original count
# run of data is any sequence of constructive identical characters "AAA" = "3A"
# Input string can contain all sorts of special characters, including numbers.
# Encoded data must be decodable, we can't run run-length-encode long runs
# "AAAAAAAAAAAAA"= "12A" can't be natively encoded as "12A" since it can be decoded as "AAAAAAAAAAAAA" OR "1AA"

# Therefore, long runs of 10 or more characters should be encoded in split fashion "9A3A"


def run_length_encoding(string) # AAA
  letters = {}
  start = 0

  while start < string.length # 0 < 4, 1 < 4, 2 < 4, 3 < 4
    letter = string[start]
    if letters[letter]
      letters[letter] = letters[letter] + 1 # {"A" => 3}
    else
      letters[letter] = 1 # {"A" => 0}
    end
    start += 1
  end #{"A" => 3}

  key_letter_conversion(letters)
end

def key_letter_conversion(letters) #{"A" => 12}
  new_string = ""
  for key, value in letters
    if value < 10
      new_string << "#{value}#{key}" # 3A
    end

    while value >= 10 # 12 >= 10,
      new_string << "9#{key}" #"9A"
      value -= 9 # when the remaining value is less than 10, it needs to be concatenated (3)
      new_string << "#{value}#{key}" if value < 10 #"9A3A"
    end
  end
  new_string
end


def run_length_encoding_alternative(string)
  current_length = 1
  encoded_letters = []

  for letter_index in (1..string.length - 1)
    current = string[letter_index]
    previous = string[letter_index - 1]

    if current != previous || current_length == 9
      encoded_letters << "#{current_length}#{previous}"
      current_length = 0
    end
    current_length += 1
  end
  encoded_letters << "#{current_length}#{previous}"
  encoded_letters.join("")
end

p run_length_encoding_alternative("AAAAAAAAAAAA")
p run_length_encoding_alternative("AAAAAAAAAAAAABBCCCCDD")
# p run_length_encoding("AAAAAAAAAAAA")
# p run_length_encoding("AAAAAAAAAAAAABBCCCCDD")