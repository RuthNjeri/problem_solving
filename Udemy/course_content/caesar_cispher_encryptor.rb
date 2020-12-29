# def caesar_cipher_encryptor(string, key)
# 	ascii_values = string.bytes
    # wrap_key = key % 26
# 	new_ascii = ascii_values.map do |ascii|
#                     next_ascii = ascii + wrap_key
#                     if next_ascii > 122
#                         restart = next_ascii % 122
#                         wrap = 96 + restart
#                         wrap.chr
#                     else
#                         next_ascii.chr
#                     end
#                 end
#     new_ascii.join("")
# end

# p caesar_cipher_encryptor("xyz", 2)

# Using Modulus

def caesar_cipher_encryptor(string, key)
	alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
	new_alphabet = []
	wrap_key = key % 26
    for char in string.split("")
        new_index = alphabet.index(char) + wrap_key
        new_alphabet << alphabet[new_index % 26]
	end
	new_alphabet.join("")
end

p caesar_cipher_encryptor("xyz", 2)
