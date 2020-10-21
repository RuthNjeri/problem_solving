require 'pry'

class Graph
  attr_accessor :adjacency_list
  def initialize
    @adjacency_list = {}
  end

  def add_vertex(value)
    return if @adjacency_list[value]

      @adjacency_list[value] = []
  end

  def add_edge(vertex_one, vertex_two)
    # You can add error handling to check the the vertices exist
    # This is an undirected graph, if directed, would not be both ways
    @adjacency_list[vertex_one] << vertex_two
    @adjacency_list[vertex_two] << vertex_one
  end

  def remove_edge(vertex_one, vertex_two)
    # You can add error handling to check the the vertices exist
    @adjacency_list[vertex_one].delete(vertex_two)
    @adjacency_list[vertex_two].delete(vertex_one)
  end

  def remove_vertex(vertex)
    @adjacency_list[vertex].each do |value|
      remove_edge(value, vertex)
    end
    @adjacency_list.delete(vertex)
  end

  def dfs_traversal_recursive(vertex)
    @result = []
    @visited = {}
    dfs_traversal_helper(vertex)
    @result
  end

  def dfs_traversal_helper(vertex)
    return nil if @adjacency_list[vertex].empty?

    @visited[vertex] = true
    @result << vertex

    @adjacency_list[vertex].each do |neighbor|
      dfs_traversal_helper(neighbor) unless @visited[neighbor]
    end
  end

  def dfs_traversal_iterative(vertex)
    stack = []
    result = []
    visited = {}
    stack << vertex
    visited[vertex] = true

    while !stack.empty?
        current_vertex = stack.pop
        result.push << current_vertex

        @adjacency_list[current_vertex].each do |neighbour|
          unless visited[neighbour]
            visited[neighbour] = true
            stack << neighbour
          end
        end
    end
    result
  end

  def bfs_traversal(vertex)
    result = []
    visited = {}
    queue = [vertex]
    visited[vertex] = true

    while queue.length > 0
      current_vertex = queue.shift
      result << current_vertex

      @adjacency_list[current_vertex].each do |neighbor|
        unless visited[neighbor]
          visited[neighbor] = true
          queue.push(neighbor)
        end
      end
    end
    result
  end
end

graph = Graph.new()
graph.add_vertex("A")
graph.add_vertex("B")
graph.add_vertex("C")
graph.add_vertex("D")
graph.add_vertex("E")
graph.add_vertex("F")

graph.add_edge("A", "B")
graph.add_edge("A", "C")
graph.add_edge("B", "D")
graph.add_edge("C", "E")
graph.add_edge("D", "E")
graph.add_edge("D", "F")
graph.add_edge("E", "F")

binding.pry