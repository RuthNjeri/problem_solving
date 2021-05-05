def minimum_effort_path(heights)
  return 0 if heights.length == 1 && heights[0].length == 1
  visited = Array.new(heights.length) {Array.new(heights[0].length, 0)}
  max_effort(0, 0, heights, visited, -Float::INFINITY)
end

def max_effort(row, col, heights, visited, effort)
  return effort if row == heights.length - 1 && col == heights[0].length - 1

  visited[row][col] = 1
  current_cell = heights[row][col]

  up, down, left, right = Float::INFINITY, Float::INFINITY, Float::INFINITY, Float::INFINITY

  up   =  max_effort(row - 1, col, heights,
          visited,[effort, (current_cell - heights[row - 1][col]).abs].max ) if row - 1 >= 0 && visited[row - 1][col] != 1
  down =  max_effort(row + 1, col, heights,
          visited, [effort, (current_cell - heights[row + 1][col]).abs].max) if row + 1 < heights.length && visited[row + 1][col] != 1
  left =  max_effort(row, col - 1, heights,
          visited, [effort, (current_cell - heights[row][col - 1]).abs].max ) if col - 1 >= 0 && visited[row][col - 1] != 1

  right =  max_effort(row, col + 1, heights,
            visited, [effort, (current_cell - heights[row][col + 1]).abs].max) if col + 1 < heights[0].length && visited[row][col + 1] != 1

  visited[row][col] = 0
  [up, down, left, right].min
end

p minimum_effort_path([[4,3,4,10,5,5,9,2],[10,8,2,10,9,7,5,6],[5,8,10,10,10,7,4,2],[5,1,3,1,1,3,1,9],[6,4,10,6,10,9,4,6]]) # 5