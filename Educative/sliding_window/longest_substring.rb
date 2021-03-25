def longest_substring(string, k)
  window_start = 0
  max_length = 0
  max_repeat_letter_count = 0
  frequency_map = {}

  for window_end in (0..string.length)
    right_char = string[window_end]
    if frequency_map[right_char].nil?
      frequency_map[right_char] = 0
    end
    frequency_map[right_char] += 1
    max_repeat_letter_count = [max_repeat_letter_count, frequency_map[right_char]].max

    if (window_end - window_start + 1) - max_repeat_letter_count > k
      left_char = string[window_start]
      frequency_map[left_char] -= 1
      window_start += 1
    end
    max_length = [max_length, window_end - window_start + 1].max
  end
  max_length
end

p longest_substring("aabccbb", 2) # 5
p longest_substring("abbcb", 1) # 4
p longest_substring("AABABBA", 1) # 4