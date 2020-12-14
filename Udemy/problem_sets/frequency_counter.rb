require 'pry'

# Given two positive integers, find out if the two numbers have
# the same frequency of digits, solution must have O(n)

def same_frequency(input1, input2)
  counter = {}
  # Check if input1 and input2 are positive integers
  for num in input1.to_s.split("")
    counter[num] = (counter_num[num] || 0) + 1
  end

  for num in input2.to_s.split("")
    if counter[num]
      if counter[num] == 1
        counter.delete(num)
      else
        counter[num] -= 1
      end
    else
      return false
    end
  end

  if counter.empty?
    true
  else
    false
  end
end
# O(n)ST

p same_frequency(182, 281) # true
p same_frequency(34, 14) # false
p same_frequency(3589578, 5879385) # true
p same_frequency(22, 222) # false


# Optimized?

def alternate_same_frequency(num_1, num_2)
  num_1_str = num_1.to_s
  num_2_str = num_2.to_s

  if num_1_str.length != num_2_str.length
    return false
  end

  count_num_1 = {}
  count_num_2 = {}

  for num in num_1_str.split("")
    count_num_1[num] = (count_num_1[num] || 0) + 1
  end

  for num in num_2_str.split("")
    count_num_2[num] = (count_num_2[num] || 0) + 1
  end

  count_num_1.map do |key, value|
    if count_num_1[key] != count_num_2[key]
      return false
    end
  end
  true
end

# O(n)ST

p alternate_same_frequency(182, 281) # true
p alternate_same_frequency(34, 14) # false
p alternate_same_frequency(3589578, 5879385) # true
p alternate_same_frequency(22, 222) # false