require 'pry'
class Node
    attr_reader :value, :priority
    def initialize(value, priority)
        @value = value
        @priority = priority
    end
end

class PriorityQueue
    def initialize(values = [])
      @values = values
    end

    def enqueue(node) # Add node to values
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

    def dequeue; end # Remove node with highest priority

end

values = [Node.new(1, 1), Node.new(2, 2), Node.new(3, 3)]
priority_queue = PriorityQueue.new(values)

node = Node.new(4, 0)
# node with priority 0 should be at the top of the heap
priority_queue.enqueue(node)

node = Node.new(4, 5)
# node with priority 5 should be at the end of the heap
priority_queue.enqueue(node)

binding.pry