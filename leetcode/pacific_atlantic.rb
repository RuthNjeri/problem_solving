# @param {Integer[][]} heights
# @return {Integer[][]}
require 'pry'
def pacific_atlantic(heights)
  row = heights.length
  col = heights[0].length
  # Initialize water flow from the pacific to the atlantic within the cells
  # This is reverse traversal, to reduce the size of the traversal
  # Therefore, water will flow from the lower cell to higher or equal,
  # Which is the reverse
  pacific = Array.new(row) { Array.new(col, 0)}
  atlantic = Array.new(row) { Array.new(col, 0)}

  # Check water flow at the top and bottom
  # To the pacific and to the atlantic
  for n in 0...col
      dfs(heights, 0, n, 0, pacific)
      dfs(heights, row - 1, n, 0, atlantic)
  end

  # Check water flow at the left and right
  # To the pacific and to the atlantic
  for m in 0...row
      dfs(heights, m, 0, 0, pacific)
      dfs(heights, m, col - 1, 0, atlantic)
  end

  # Find the intersection of both oceans
  res = []
  binding.pry
  for m in 0...row
      for n in 0...col
          if pacific[m][n] == 1 && atlantic[m][n] == 1
              res << [m, n]
          end
      end
  end
  res 
end

def dfs(heights, row, col, prev_val, ocean)
  # Check out of bounds
  return if row > heights.length - 1 || row < 0
  return if col > heights[row].length - 1 || col < 0
  # Return if cell is lower than prev cell
  return if heights[row][col] < prev_val
  # Return if cell is already visited
  return if ocean[row][col] == 1

  # Mark cell as visited
  ocean[row][col] = 1

  dfs(heights, row - 1, col, heights[row][col], ocean)
  dfs(heights, row + 1, col, heights[row][col], ocean)
  dfs(heights, row, col - 1, heights[row][col], ocean)
  dfs(heights, row, col + 1, heights[row][col], ocean)
end

p pacific_atlantic([[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]])







