# frozen_string_literal: true

# Merge Two arrays
def merge_arrays(array_1, array_2)
  sorted_array = []
  arr_1_index  = 0
  arr_2_index = 0

  while arr_1_index < array_1.length && arr_2_index < array_2.length
    if array_1[arr_1_index] < array_2[arr_2_index]
      sorted_array << array_1[arr_1_index]
      arr_1_index += 1
    else
      sorted_array << array_2[arr_2_index]
      arr_2_index += 1
    end
  end
  while arr_1_index < array_1.length
    sorted_array << array_1[arr_1_index]
    arr_1_index += 1
  end
  while arr_2_index < array_2.length
    sorted_array << array_2[arr_2_index]
    arr_2_index += 1
  end
  sorted_array
end

def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  left = merge_sort(arr[0, mid])
  right = merge_sort(arr[mid, arr.length])
  merge_arrays(left, right)
end


p merge_sort([15, 16, 18, 20 ,1, 2])