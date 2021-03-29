require 'pry'

def solution(s)
  # write your code in Ruby 2.2
  # Ex: "BAAABAB" "BBAA"
  # Track delete, s length, prev s
  delete_b = 0
  b_s = s
  a_s = s.dup
  delete_a = 0
  delete = 0
  length = s.length
  prev = 0
  start = 1

  while start < s.length
    # Check that the next value is in order "AB"
    # Check that the prev value is in order "AB"
    # binding.pry
    if b_s[prev] > b_s[start] # "BA"
      # binding.pry
      delete_b += 1
      b_s[prev] = b_s[start]
      start = prev
    else 
      start += 1
    end
    prev = start - 1 if start > 0
  end

  prev = 0
  start = 1

  while start < s.length
    # Check that the next value is in order "AB"
    # Check that the prev value is in order "AB"
    if a_s[prev] > a_s[start]  # "BA"
      delete_a += 1
      a_s[start] = a_s[prev]
      start = prev
      # binding.pry
    else
      start += 1
    end
    prev = start - 1 if start > 0
  end

  delete = if delete_a != 0 && delete_b != 0
              [delete_a, delete_b].min
            elsif delete_a != 0 && delete_b.zero?
              delete_a
            elsif delete_b != 0 && delete_a.zero?
              delete_b
            else
            delete
            end

  # binding.pry
end

p solution("BBBBA")