# frozen_string_literal: true

# Pivot helper

def swap(arr, index_1, index_2)
  temp = arr[index_1]
  arr[index_1] = arr[index_2]
  arr[index_2] = temp
end

def pivot_helper(arr, start_ix = 0, end_ix = arr.length - 1)
  pivot_number = start_ix
  current_pivot = start_ix

  while start_ix <= end_ix
    if arr[pivot_number] > arr[start_ix]
      current_pivot += 1
      swap(arr, current_pivot, start_ix)
    end
    start_ix += 1
  end
  if current_pivot != pivot_number
    swap(arr, current_pivot, pivot_number)
    return current_pivot
  end
  current_pivot
end

# p pivot_helper [0, 1, 2, 3, 4, 5, 6, 7, 8]

def  quick_sort(arr, left = 0, right = arr.length - 1)
    if left < right
        pivot_index = pivot_helper(arr, left, right)

        quick_sort(arr, left, pivot_index - 1)
        quick_sort(arr, pivot_index + 1, right)
    end
    return arr
end

p quick_sort [100, 1, 2, -30, 4, 5, 6, 7, 8]













