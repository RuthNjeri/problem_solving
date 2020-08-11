# frozen_string_literal: true

def sum_zero(array)
  left = 0
  right = array.size - 1

  while left < right
    sum = array[left] + array[right]
    return [array[left], array[right]] if sum.zero?

    sum.negative? ? left += 1 : right -= 1
  end
  []
end

p sum_zero([-4, -3, 0, 1, 9])
