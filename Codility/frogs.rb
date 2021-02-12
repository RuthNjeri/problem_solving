# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"
require 'pry'
def solution(blocks)
  # write your code in Ruby 2.2
  # EX: [2, 6, 8, 5]
  distance = 0
  @blocks = blocks
  # Each block is a starting point. Find the distance recursively
  for block in (0..blocks.length - 1 )
    new_distance = blocks_distance(block)
    distance = [new_distance, distance].max
  end
  distance
end

def blocks_distance(start)
  # Move frog one until you can't anymore
  # Move frog two until you can't anymore
  # Add the distance
  # binding.pry
  frog_1 = if start > 0 # If frog 1 is not on the first block go backwards
              next_step = start - 1
              # binding.pry
              if @blocks[next_step] >=  @blocks[start]
                start =  next_step
                blocks_distance(start)
              else # cannot move
                return start
              end
          else # frog at the starting point 0
            return start
          end
  frog_2 = if start < @blocks.length # frog_2 will always move forward
            next_step = start + 1
            if @blocks[next_step] >=  @blocks[start]
              start =  next_step
              blocks_distance(start)
            else # cannot move
              return start
            end
          end
  frog_2 - frog_1 + 1
end

# p solution([2, 6, 8, 5])
p solution([2])
