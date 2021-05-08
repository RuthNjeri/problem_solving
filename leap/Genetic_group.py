def solution(S, P, Q):
 # write your code in Python 3.6
 result = []
 prefix_sum = [0 for _ in range(len(S) + 1)]
 
 mapping = {"A": 1, "C": 2, "G": 3, "T": 4}
 
 if len(S) == 1:
 result.append(mapping[S[0]])
 return result
 
 for index in range(1, len(S) + 1):
 prefix_sum[index] = prefix_sum[index - 1] + mapping[S[index - 1]]
 
 for number in Q:
 result.append(prefix_sum[number + 1] - prefix_sum[number])
 
 return result


#  index:      [0, 1, 2, 3,  4,  5,  6]
# array:      [4, 2, 2, 5,  1,  5,  8]
# cumulative: [4, 6, 8, 13, 14, 19, 27]

# P = 3; Q = 4; Average = (5+1)/2 = 3
# cumulative[Q] - cumulative[P-1] / (Q-P+1)

# Variables:
#     average
#     index 
#     window size?