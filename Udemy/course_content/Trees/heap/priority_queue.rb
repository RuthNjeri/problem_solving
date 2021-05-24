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

      while parent_priority < index_priority && !index.zero?
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

er = PriorityQueue.new();

er.enqueue("common cold", 1)
er.enqueue("gunshot wound", 5)
er.enqueue("high fever", 2)

# Order of dequeue... gunshot wound, high fever, common cold

# Big O
# Insertion - O(log n)
# Removal - O(log n)
# Search - O(n).. no guaranteed order with the siblings




binding.pry