
# Do not worry about negative bases and exponents
def power(base, exponent)

  return 1 if exponent == 0

  base * power(base, exponent - 1)
end