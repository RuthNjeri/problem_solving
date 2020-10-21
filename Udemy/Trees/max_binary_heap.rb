# require 'pry'
class MaxBinaryHeap
  attr_accessor :values

  def initialize(values = [])
    @values = values
  end

  def insert(node)
    @values.push(node)
    bubble_up
  end

  def bubble_up
    index = @values.length - 1
    parent_index = (index - 1) / 2

    while @values[parent_index] < @values[index] && !index.zero?
      @values[parent_index], @values[index] = @values[index], @values[parent_index]

      index = parent_index
      parent_index = (index - 1) / 2
    end
    @values
  end

  def extract_max
    max = @values.first
    last = @values.pop
    length = @values.length
    if length > 0
      @values[0] = last
      sink_down
    end
    max
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
        swap = left_child_idx if @values[left_child_idx] > parent
      end
      if right_child_idx < length
        right_child = @values[right_child_idx]
        if swap == false && right_child > parent || swap != false && right_child > @values[left_child_idx]
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

heap = MaxBinaryHeap.new([55, 39, 41, 18, 27, 12, 33])
# binding.pry
# heap.insert(70)
# heap.extract_max
