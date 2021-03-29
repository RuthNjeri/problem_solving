require 'pry'
# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(ranks)
  # write your code in Ruby 2.2
  # ranks = [4, 2, 0]
  # Create a hash to store all available ranks
  ranks_list = {}
  same_superior = 0
  for rank in ranks
    ranks_list[rank.to_s] = 0 if ranks_list[rank.to_s].nil?
  end
  # Should return ranks_list = {4 : 0, 2: 0, 0: 0}

  # Increment rank list ranks if rank + 1 exists in rank list
  for soldier in ranks
    superior = soldier + 1
    ranks_list[superior.to_s] =  ranks_list[superior.to_s] + 1 if ranks_list[superior.to_s]
  end

  # Tally all soldiers reporting to the same superior
  for rank, value in ranks_list
    same_superior += value
  end

  same_superior
end


p solution([3, 4, 3, 0, 2, 2, 3, 0, 0])
