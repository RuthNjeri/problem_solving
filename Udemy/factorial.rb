require 'pry'
def factorial(number)
  return 0 unless number.positive? 

  return 1 if number == 1

  number * factorial(number - 1)
end

p factorial(5)