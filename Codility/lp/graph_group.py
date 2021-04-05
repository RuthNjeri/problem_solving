adj_matrix = {}

for i in range(len(A)):
  adj_matrix[(A[i], B[i])] = True
  adj_matrix[(B[i], A[i])] = True

for i in range(1, N):
  if (i, i + 1) not adj_matrix:
  return False
return True