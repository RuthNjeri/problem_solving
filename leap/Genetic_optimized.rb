def solution(s, p, q) # Codility results: https://app.codility.com/demo/results/trainingAJFQ57-KY3/
  # write your code in Ruby 2.2
  impacts = {'A' => 1, 'C' => 2, 'G' => 3, 'T' => 4}
  results = []
  nucleotides = {'A' => [0] * s.length, 'C'=> [0] * s.length, 'G'=> [0] * s.length, 'T'=> [0] * s.length}
  prefix_sums = {'A'=> [0] * (s.length + 1), 'C'=> [0] * (s.length + 1), 'G'=> [0] * (s.length + 1), 'T'=> [0] * (s.length + 1) }


  # Insert 1 in the index position of a nucleotide in s
  for nucleotide in (0..(s.length - 1))
    if s[nucleotide] == 'A'
      nucleotides['A'][nucleotide] = 1
    elsif s[nucleotide] == 'C'
      nucleotides['C'][nucleotide] = 1
    elsif s[nucleotide] == 'G'
      nucleotides['G'][nucleotide] = 1
    else
      nucleotides['T'][nucleotide] = 1
    end
  end


  # Sum up the prefix values of nucleotides in their positions
  for key, values in prefix_sums
    for value in (1..values.length - 1)
      values[value] = values[value - 1] + nucleotides[key][value-1]
    end
  end

  # If the last + 1 - first - 1 is greater than 0, that means a value exists
  # append the value in the result and return it.
  for position in (0..(p.length - 1))
    first = p[position]
    last =  q[position]
    for key, values in prefix_sums
      if values[last + 1] - values[(first + 1) - 1] > 0
        results << impacts[key]
        break
      end
    end
  end
  results
end

# Alternative Solution.
# Received 86% in Codility, failed at the extreme large test

# Loop through the slice range..p.length
  # If A is found append 1 in results... s[p...q].include? 'A'
    # results << 1
    # Go to next iteration point of the loop using next
  # If C is found append 1 in results... s[p...q].include? 'C'
    # results << 2
    # Go to next iteration point of the loop using next
  # If G is found append 1 in results... s[p...q].include? 'G'
    # results << 3
    # Go to next iteration point of the loop using next
  # If T is found append 1 in results... s[p...q].include? 'T'
    # results << 4
    # Go to next iteration point of the loop using next