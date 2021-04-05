def num_islands(grid)
  count = 0
  # Loop through the grid, call dfs if island is found
  # increment the island count
  for row in 0...grid.length
      for col in 0...grid[row].length
          if grid[row][col] == "1"
              dfs_islands(grid, row, col)
              count += 1
          end
      end
  end
  count
end

def dfs_islands(grid, row, col)
  # Break out of the call stack if the grid is 0 or out of bounds
  return if row < 0 || row > grid.length - 1
  return if col < 0 || col > grid[row].length - 1
  return if grid[row][col] == "0"
  # Convert the cell to 0 to avoid double count
  # Call the island on the right, left, top, and bottom
  grid[row][col] = "0"
  dfs_islands(grid, row, col + 1)
  dfs_islands(grid, row, col - 1)
  dfs_islands(grid, row - 1, col)
  dfs_islands(grid, row + 1, col)
end