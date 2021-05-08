require 'pry'

def solution(a)
  # write your code in Ruby 2.2
  back = 0
  front = a.length - 1
  abs_distinct = 1

  while back < front # Two pointers at the back an front should stop if they are equal
    # Remove the duplicates
    while  back < a.length - 1 && a[back] == a[back + 1]
      back += 1
    end
    while front > 0 && a[front] == a[front - 1]
      front -= 1
    end

    # break if front is ahead of back and viceversa or if front and back are equal
    if front <= back
      break
    end

    # Move front or back depending on the larger item
    if a[back].abs > a[front].abs
      back += 1
    elsif a[front].abs > a[back].abs
      front -= 1
    else
      front -= 1
      back += 1
      break if back > front # For a situation where [-3, -3, -3, 3, 3, 3]
    end
    abs_distinct += 1
  end
  abs_distinct
end

# 1, 2, 3, 4, 5

p solution([-5,-3,-1 ,0 , 3, 6])
# p solution([-3, -3, -3, 3, 3, 3]) # edge case => 1
# p solution([|5, 5, 5, 5, 5, 5, 5]) # edge case => 1
# p solution([9]) # edge case => 1
