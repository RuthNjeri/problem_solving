# Input: string of characters, document to generate
# Output: boolean

# Frequency of unique characters in the string should match the document

# O(m + n)T #O(c)S...c is the number of unique characters in the document, m is no of characters in characters, n is no of
# characters in document
def generate_document(characters, document) # "Bstee si", "Best is"
  return false if document.length > characters.length

  document_chars = {}

  for char_index in (0..document.length - 1) # 0, 1, 2, 3, 4, 5, 6
    char = document[char_index] # Best is
    if document_chars[char]
      document_chars[char] += 1 # {"B" => 1,  e => 1, s => 2, t => 1, " " => 1 }
    else
      document_chars[char] = 1 # {"B" => 1,  e => 1, s => 2, t => 1, " " => 1, i => 1 }
    end
  end

  # {"B" => 1,  e => 1, s => 2, t => 1, " " => 1, i => 1 }
  for character_index in (0..characters.length - 1) # 0...i
    character = characters[character_index] # Bstee is
    if document_chars[character]
      document_chars[character] -= 1# {"B" => 0,  e => 0, s => 0, t => 0, " " => 0, i => 0 }
      document_chars.delete(character) if document_chars[character].zero? # {}
    end
    return true if document_chars.length.zero?
  end
  false
end


p generate_document("Bstee si", "Best is")
p generate_document("Bste!hetsi ogEAxpelrt x ", "AlgoExpert is the Best!")