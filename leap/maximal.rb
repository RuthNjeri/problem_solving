# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"


# loop through A,B checking the connection order them by number connections
#


def solution(n, a, b)
  # write your code in Ruby 2.2
  mapping = {}
  counter = 0

  while counter < a.length
    if mapping[a[counter]].nil?
      mapping[a[counter]] = 1
    else
      mapping[a[counter]] = mapping[a[counter]] += 1
    end
    if mapping[b[counter]].nil?
      mapping[b[counter]] = 1
    else
      mapping[b[counter]] = mapping[b[counter]] += 1
    end
    counter += 1
  end

  # Sort the weights according to the highest neighbor value

  weights = mapping.sort_by {|key, value| value }.reverse.to_h

  for key, _ in weights
    weights[key] = n
    n -= 1
  end

  maximal = 0

  for num in 0...a.length
    maximal += weights[a[num]]
    maximal += weights[b[num]]
  end
  maximal
end