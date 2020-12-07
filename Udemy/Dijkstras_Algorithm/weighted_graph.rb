require 'pry'

class WeightedGraph
  attr_accessor :adjacency_list

  def initialize
    @adjacency_list = {}
  end

  def add_vertex(vertex)
    unless @adjacency_list[vertex]
      @adjacency_list[vertex] = []
    end
  end

  def add_edge(vertex_1, vertex_2, weight)
    @adjacency_list[vertex_1].push({node:vertex_2, weight: weight})
    @adjacency_list[vertex_2].push({node:vertex_1, weight: weight})
  end

end

graph = WeightedGraph.new()

graph.add_vertex('A')
graph.add_vertex('B')
graph.add_vertex('C')

graph.add_edge("A", "B", 9)
graph.add_edge("A", "C", 5)
graph.add_edge("B", "C", 7)

binding.pry
