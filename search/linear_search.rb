
def linear_search(array, value)
  array.each_with_index do |item, index|
    return index if item == value
  end
  nil
end

p linear_search([1, 2, 3, 4], 4)