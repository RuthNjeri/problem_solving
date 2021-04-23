
def non_constructible_change(coins)
  change = 0
  coins.sort!

  for coin in coins
    if coin > change + 1
      return change + 1
    end
    change += coin
  end
  change + 1
end

# Test Cases
p non_constructible_change([5, 7, 1, 1, 2, 3, 22]) # 20
p non_constructible_change([1, 2, 5]) # 4
p non_constructible_change([5, 8, 20]) # 1
