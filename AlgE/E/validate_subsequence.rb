
# O(n)T
# O(1)S
def validate_subsequence(nums_1, nums_2)
  pointer_1 = 0
  pointer_2 = 0

  while pointer_1 <= nums_1.length
    if nums_1[pointer_1] == nums_2[pointer_2]
      pointer_2 += 1
    end
    return true if pointer_2 == nums_2.length

    pointer_1 += 1
  end

  false
end

p validate_subsequence([5, 1, 22, 25, 6, -1, 8, 10], [1, 6, -1, 10])