# frozen_string_literal: true

def max_subarray(numbers_list, n)
  left_pointer = 0
  right_pointer = n - 1
#   largest_sum = []

  return nil if numbers_list.empty? || numbers_list[right_pointer].nil?

  while left_pointer < numbers_list.size && !numbers_list[right_pointer].nil?
    sub_array = numbers_list[left_pointer..right_pointer]
    current_sum = 0
    sub_array.each do |num|
      current_sum += num
    end
    largest_sum = current_sum if current_sum > largest_sum

    left_pointer += 1
    right_pointer += 1
  end

  largest_sum
end

p max_subarray([2, 2], 2)
