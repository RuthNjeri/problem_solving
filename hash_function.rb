# frozen_string_literal: true

require 'pry'

def hash(string, length)
  total = 0

  string.bytes.each  do |byte|
    position = byte - 96
    total = (total + position) % length
  end
  total
end

hash('pink', 10)
binding.pry
