# Function that accepts a variable number of arguments
# checks whether there are any duplicates among the arguments passed in

def are_there_duplicates(*args)
  input = args.sort # O(nlogn)
  counter_1 = 0

  while counter_1 != input.length
    counter_2 = counter_1 + 1
    if input[counter_1] == input[counter_2]
      return true
    end
    counter_1 += 1
  end
  false
end

p are_there_duplicates(1, 2, 3) # false
p are_there_duplicates(1, 2, 2) # true
p are_there_duplicates('a', 'b', 'c', 'a') # true
