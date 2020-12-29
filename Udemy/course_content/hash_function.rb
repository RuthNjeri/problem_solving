# frozen_string_literal: true

require 'pry'

def hash(string, array_length)
  total = 0
  # Hashes take advantage of prime numbers to avoid collision.
  prime_number = 31

  # Reduce the time taken if the length is greater than 100
  min_length = [string.length - 1, 100].min
  (0..min_length).each do |index|
    position = string[index].ord - 96
    total = (total * prime_number + position) % array_length
  end
  total
end

# Handling collisions
  # Separate chaining; store multiple key value pairs in the same position by nesting arrays.
  # Linear Probing; store one piece of data at each position,
  # if collision happens, you forward the data to the next position

puts hash('pink', 10)
# binding.pry
