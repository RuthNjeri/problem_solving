require 'pry'

class PriorityQueue
  attr_accessor :values

  def initialize
    @values = []
  end

  def enqueue(val, priority)
    @values.push({val: val, priority: priority}) # [{ val: 'A', priority: 1}, { val: 'B', priority: 2}, { val: 'C', priority: 3}]
    sort_values
  end

  def dequeue
    @values.shift
  end

  def sort_values
    @values.sort! {| a, b| a[:priority] <=> b[:priority]}
  end
end

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

  def djikstra(start, finish)
    nodes = PriorityQueue.new
    distances = {}
    previous = {}
    smallest = nil
    path = [] # To be returned

    # Build up initial state
    @adjacency_list.map do |vertex, value|
      if vertex == start
          distances[vertex] = 0
          nodes.enqueue(vertex, 0)
      else
          distances[vertex] = Float::INFINITY
          nodes.enqueue(vertex, Float::INFINITY)
      end
      previous[vertex] = nil
    end

    # As long as there is something to visit
    while nodes.values.length.positive?
      smallest = nodes.dequeue[:val]
      if smallest == finish
        while previous[smallest]
          path.push(smallest)
          smallest = previous[smallest]
        end
        break
      end

      if smallest || distances[smallest] != Infinity
        for neighbor in @adjacency_list[smallest]
          # calculate new distances to neighboring node
          total_neighbor_distance = distances[smallest] + neighbor[:weight]
          neighbor_node = neighbor[:node]
          if total_neighbor_distance < distances[neighbor_node]
            # Update new smallest neighbor to distance
            distances[neighbor_node] = total_neighbor_distance
            # Update previous, how we got to next neighbor
            previous[neighbor_node] = smallest
            # Enqueue in priority queue with new priority
            nodes.enqueue(neighbor_node, total_neighbor_distance)
          end
        end
      end

    end
    p path.push(smallest).reverse
  end
end



graph = WeightedGraph.new()

graph.add_vertex('A')
graph.add_vertex('B')
graph.add_vertex('C')
graph.add_vertex('D')
graph.add_vertex('E')
graph.add_vertex('F')

graph.add_edge("A", "B", 4)
graph.add_edge("A", "C", 2)
graph.add_edge("B", "E", 3)
graph.add_edge("C", "D", 2)
graph.add_edge("C", "F", 4)
graph.add_edge("D", "E", 3)
graph.add_edge("D", "F", 1)
graph.add_edge("E", "F", 1)

graph.djikstra("A", "D")