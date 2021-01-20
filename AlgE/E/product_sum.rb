
# O(n) time, O(d) space(depth of the arrays)
def product_sum(array, multiplier = 1)
  sum = 0

  for element in array
    if element.class == Array
      sum += product_sum(element, multiplier + 1)
    else
      sum += element
    end
  end
  sum * multiplier
end

p product_sum([1, 2, [3, 4, [5, 6]], 7]) # 90