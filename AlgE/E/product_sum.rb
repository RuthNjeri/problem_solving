
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



# Second attempt

def product_sum_2(array, depth = 1) # d = 2
  sum = 0

  for num in array
    sum += if num.class == Array
            product_sum(num, depth + 1) # d = 3
           else
            num
           end
  end
  sum *= depth
end

p product_sum_2([1, 2, [3, 4, [5, 6]], 7])

