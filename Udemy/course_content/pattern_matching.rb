require 'pry'
def find_permutation(str, pattern)
	pattern_array = pattern.split('')
	pattern_length = pattern_array.size
	total_ascii = 0
    window_start = 0
    window_end = pattern_length - 1

	if pattern_length > str.size
		return false
	end

    for character in pattern_array
		total_ascii += character.bytes[0].to_i
    end

	while (window_end - window_start) == pattern_length - 1 && window_end <= str.size - 1
        sliced_string = str[window_start..window_end]
        current_ascii = 0
		sliced_string.each_byte do |byte|
			current_ascii += byte.to_i
		end
		if current_ascii == total_ascii
			return true
		end
		window_start += 1
    window_end += 1
	end
	false
end

p find_permutation('bdasas', 'acb' )

