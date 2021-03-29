require 'pry'

def solution(a)
  # write your code in Ruby 2.2
  counter = 0
  cars = a.length - 1

  for car in (0..cars)
    next_car = car + 1
    for passing_car in (next_car..cars)
      if car < passing_car
        counter += 1
      end
      puts counter
    end
  end
  counter
end

p solution([0, 1, 0, 1, 1])