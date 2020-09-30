require 'pry'

def get_digit(num, position)
  new_digit = num.abs / 10**position
  new_digit % 10
end

def digit_count(num)
  return 1 if num.zero?

  position = Math.log(num, 10) + 1
  position.to_i
end

def most_digits(nums)
  largest_number = 0

  nums.each do |num|
    current_number = digit_count(num)
    largest_number = [current_number, largest_number].max
  end
  largest_number
end

def radix_sort(numbers)
  largest_digits = most_digits(numbers)

  # O(nk) n..length of array, k..number of digits
  (0..largest_digits).each do |position|
    bucket = Array.new(10) { Array.new(10).compact! }
    numbers.each do |num|
      digit = get_digit(num, position)
      bucket[digit] << num
    end
    numbers = bucket.flatten
  end
  numbers
end

puts radix_sort([1, 9, 4, 4, 3, 8, 4, 7, 6]).inspect
# def get_digit(num, position)
#   reversed = num.to_s.reverse

#   reversed[position].to_i
# end
