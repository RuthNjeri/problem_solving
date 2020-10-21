
def binary_search(array, value)
  left = 0
  right = array.length - 1
  mid = (left + right) / 2

  while left < right
    left = mid + 1 if value > array[mid]
    right = mid - 1 if value < array[mid]
    return mid if array[mid] == value
    mid = (left + right) / 2
  end


  nil
end

p binary_search([1, 2, 3, 4, 5, 6, 7, 8], 2)