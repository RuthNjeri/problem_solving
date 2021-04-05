require 'pry'

def pacific_atlantic(matrix)
  return [] if matrix.empty?
  pacific = Array.new(matrix.length) { Array.new(matrix[0].length, false) }
  atlantic = Array.new(matrix.length) { Array.new(matrix[0].length, false) }

  # left side pacific column
  for i in 0...matrix.length
    dfs(matrix, i, 0, pacific)
  end

  # upper side pacific row
  for j in 0...matrix[0].length
    dfs(matrix, 0, j, pacific)
  end

  # right side atlantic column
  for i in 0...matrix.length
    dfs(matrix, i, matrix[0].length - 1, atlantic)
  end

  # down side atlantic row
  for j in 0...matrix[0].length
    dfs(matrix, matrix.length - 1, j, atlantic)
  end
  binding.pry
  res = []
  for i in 0...matrix.length
    for j in 0...matrix[0].length
      res << [i, j] if pacific[i][j] && atlantic[i][j]
    end
  end
  res
end

def dfs(matrix, i, j, visited)
  visited[i][j] = true
  dfs(matrix, i+1, j, visited) if i+1 < matrix.size && !visited[i+1][j] && matrix[i+1][j] >= matrix[i][j]
  dfs(matrix, i-1, j, visited) if i-1 >= 0 && !visited[i-1][j] && matrix[i-1][j] >= matrix[i][j]
  dfs(matrix, i, j+1, visited) if j+1 < matrix[0].size && !visited[i][j+1] && matrix[i][j+1] >= matrix[i][j]
  dfs(matrix, i, j-1, visited) if j-1 >= 0 && !visited[i][j-1] && matrix[i][j-1] >= matrix[i][j]
end

p pacific_atlantic([[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]])
