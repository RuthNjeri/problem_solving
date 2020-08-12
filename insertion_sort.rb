# frozen_string_literal: true
require 'pry'

def insertion_sort(array)
  outer_index = 1

  while outer_index < array.length
    current_number = array[outer_index]
    inner_index = outer_index - 1
    while inner_index >= 0 && array[inner_index] > current_number
      array[inner_index + 1] = array[inner_index]
      inner_index -= 1
    end
    array[inner_index + 1] = current_number

    outer_index += 1
  end
  array
end

p insertion_sort([2, 5, 9, 8, 4])
