
def binary_search(array, value)
  left = 0
  right = array.length - 1

  while left <= right
    mid = (left + right) / 2
    left = mid + 1 if value > array[mid]
    right = mid - 1 if value < array[mid]
    return mid if array[mid] == value
  end
  nil
end

p binary_search([-1, -2, -3, 2, 5, 6, 7, 8], 2) # 3
p binary_search([0, 1, 21, 33, 45, 45, 61, 71, 72, 73], 33) # 3