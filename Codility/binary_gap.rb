# A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends
# in the binary representation of N.

# For example, number 9 has binary representation 1001 and contains a binary gap of length 2.
# The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3.
# The number 20 has binary representation 10100 and contains one binary gap of length 1.
# The number 15 has binary representation 1111 and has no binary gaps.
# The number 32 has binary representation 100000 and has no binary gaps.

# Write a function:

# def solution(n)

# that, given a positive integer N, returns the length of its longest binary gap.
# The function should return 0 if N doesn't contain a binary gap.

# For example, given N = 1041 the function should return 5,
# because N has binary representation 10000010001 and so its longest binary gap is of length 5.
#  Given N = 32 the function should return 0, because N has binary representation '100000' and thus no binary gaps.

# Write an efficient algorithm for the following assumptions:

# N is an integer within the range [1..2,147,483,647].

# 0(n)T | O(1)S
def solution(n) # 9
  binary = n.to_s(2) # "1001<"
  pointer_1 = 0
  pointer_2 = 1
  max_len = 0
  counter = 0

  while pointer_2 < binary.length # 1 < 4, 2 < 4
    if binary[pointer_1].to_i == 1 && binary[pointer_2].to_i == 0 # 100
       counter += 1 # 1, 2
       pointer_2 += 1 # 2, 3
       if binary[pointer_2].to_i == 1
          max_len = [max_len, counter].max #[0, 2]
          counter = 0
          pointer_1 = pointer_2
          pointer_2 = pointer_1 + 1
       end
       break if pointer_2 == binary.length
    else
      pointer_1 += 1
      pointer_2 += 1
    end
  end
  max_len
end

# p solution(9)
# p solution(15)
# p solution(32)
p solution(328)