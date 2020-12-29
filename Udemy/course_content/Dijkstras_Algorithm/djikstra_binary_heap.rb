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
      smallest = nodes.dequeue.value
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

class PriorityQueue
  attr_accessor :values
  def initialize(values = [])
    @values = values
  end

  def enqueue(value, priority) # Add node to values
    node = Node.new(value, priority)
    @values.push(node)
    bubble_up
  end

  def bubble_up
    index = @values.length - 1
    parent_index = ( index - 1 ) / 2
    parent_priority = @values[parent_index].priority
    index_priority = @values[index].priority

    while parent_priority > index_priority && !index.zero?
      @values[parent_index], @values[index] = @values[index], @values[parent_index]

      index = parent_index
      parent_index = (index - 1) / 2
      parent_priority = @values[parent_index].priority
      index_priority = @values[index].priority
    end
    @values
  end

  def dequeue  # Remove node with highest priority
    highest_priority = @values.first
    lowest_priority = @values.pop
    length = @values.length
    if length > 0
      @values[0] = lowest_priority
      sink_down
    end
    highest_priority
  end

  def sink_down
    parent_idx = 0
    length = @values.length
    parent = @values[parent_idx]

    loop do
      left_child_idx = 2 * parent_idx + 1
      right_child_idx = 2 * parent_idx + 2
      swap = false
      if left_child_idx < length
        swap = left_child_idx if @values[left_child_idx].priority > parent.priority
      end
      if right_child_idx < length
        right_priority = @values[right_child_idx].priority
        if swap == false && right_priority < parent.priority || swap != false && right_priority > @values[left_child_idx].priority
          swap = right_child_idx
        end
      end
      break unless swap

      @values[parent_idx] = @values[swap]
      @values[swap] = parent
      parent_idx = swap
    end

  end
end

class Node
  attr_reader :value, :priority
  def initialize(value, priority)
      @value = value
      @priority = priority
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

graph.djikstra("A", "E")