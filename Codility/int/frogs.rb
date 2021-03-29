# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"
require 'pry'
def solution(blocks)
  # write your code in Ruby 2.2
  # EX: [2, 6, 8, 5]
  distance = 0
  # frog_1 = 9
  @blocks = blocks
  # Each block is a starting point. Find the distance recursively
  for block in (0..blocks.length - 1)
    frog_1 = frog_1_distance(block)
    frog_2 = frog_2_distance(block)
    new_distance= frog_2 - frog_1 + 1
    distance = [new_distance, distance].max
  end
  distance
end

def frog_1_distance(start)
  return start if start.zero?
  # If frog 1 is not on the first block go backwards
  next_step =  start - 1
  return start if next_step < 0
  if @blocks[next_step] >=  @blocks[start]
    start =  next_step
    frog_1_distance(start)
  else # cannot move
    start
  end
end

def frog_2_distance(start)
  return start if start == @blocks.length - 1
  # frog_2 will always move forward
  next_step = start + 1
  if @blocks[next_step] >=  @blocks[start]
    start =  next_step
    frog_2_distance(start)
  else # cannot move
    return start
  end
end

p solution([2, 6, 8, 5])
p solution([1, 5, 5, 2, 6])
p solution([2])
