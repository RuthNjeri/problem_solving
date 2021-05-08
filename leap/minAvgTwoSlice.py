def prefix_sums(arr: list):
    """
    The array returned here is one element larger than the original
    :param arr:
    :return:
    """
    n = len(arr)
    P = [0] * (n + 1)
    for k in range(1, n + 1):
        P[k] = P[k - 1] + arr[k - 1]
    return P

def count_total(P, x, y):
    """
    :param P: a Prefix sum array
    :param x:
    :param y:
    :return:
    """
    return P[y + 1] - P[x]

def solution(A):
    """
    Detected time complexity: O(N ** 2)
    :param A:
    :return:
    """
    index = 0
    avg = A[0]
    pref_array = prefix_sums(A)
    print(f"A is {A}")
    print(f"pref_array is {pref_array}\n")
    for j in range(0, len(A)-1):
        print(f"\nj is {j}, A[j] is {A[j]}")
        for k in range(1, len(A) - j):
            P, Q = j, j + k
            print(f"k is {k}, A[Q] is {A[Q]}")
            print(f"avg before is {avg}")
            new_avg = count_total(pref_array, P, Q) / (Q - P + 1)
            index = P if new_avg < avg else index
            avg = new_avg if new_avg < avg else avg
            print(f"P is {P}, Q is {Q}, new_avg is {new_avg}")
            print(f"avg after is {avg}, index is {index}\n")

    # for i in range(P+1, len(A)):
    #     #print(f"avg before is {avg}")
    #     new_avg = count_total(pref_array, P, Q) / (Q - P + 1)
    #     avg = new_avg if new_avg < avg else avg
    #     index = P if new_avg < avg else index
    #     print(f"P is {P}, Q is {Q}, new_avg is {new_avg}")
    #     #print(f"avg after is {avg}")
    #     Q = Q + 1
    return index