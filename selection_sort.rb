# frozen_string_literal: true

def selection_sort(number_list)
  outer_index = 0

  while outer_index < number_list.length
    min_number = outer_index
    inner_index = outer_index + 1
    while inner_index < number_list.length
      if number_list[inner_index] < number_list[min_number]
        min_number = inner_index
      end
      inner_index += 1
      end
    if min_number != outer_index
      temp = number_list[min_number]
      number_list[min_number] = number_list[outer_index]
      number_list[outer_index] = temp
    end
    outer_index += 1
  end
  number_list
end

p selection_sort([84, 2, 10, 1, 10])
