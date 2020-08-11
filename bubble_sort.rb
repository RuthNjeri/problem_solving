# frozen_string_literal: true

# def bubble_sort(array)
#     outer_index = array.size
#     while outer_index > 0
#       inner_index = 0
#         while inner_index < outer_index - 1
#           if array[inner_index] > array[inner_index + 1]
#               temp = array[inner_index]
#               array[inner_index] = array[inner_index + 1]
#               array[inner_index + 1] = temp
#           end
#           inner_index += 1
#        end
#       outer_index -= 1
#     end
#     array
# end

# Optimized
def bubble_sort(array)
  outer_index = array.size
  while outer_index > 0
    no_swap = true
    inner_index = 0
    while inner_index < outer_index - 1
      if array[inner_index] > array[inner_index + 1]
        temp = array[inner_index]
        array[inner_index] = array[inner_index + 1]
        array[inner_index + 1] = temp
        no_swap = false
      end
      inner_index += 1
   end
    break if no_swap

    outer_index -= 1
  end
  array
end

p bubble_sort([9, 1, 3, 5, 6])
