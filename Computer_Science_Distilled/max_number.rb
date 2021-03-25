
def max(a, b, c)
  max = 0
  if a > b
    if a > c
      max = a
    else
      max = c
    end
  else
    if b > c
      max = b
    else
      max = c
    end
  end
  max
end


p max(5, 7, 8)