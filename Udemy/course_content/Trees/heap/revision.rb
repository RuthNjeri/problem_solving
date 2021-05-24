# Insertion in a binary heap
require 'pry'
def insert(value)
  @max_heap = [41, 39, 33, 18, 27, 12]
  # Insert the value at the end
  @max_heap << value
  # bubble up to find the correct position of the value
  # if the heap has more than one value
  bubble_up() if @max_heap.length > 1
  @max_heap
end

def bubble_up
  # We want to compare the value we have inserted with its parent
  parent_idx = (@max_heap.length - 2) / 2
  child_idx = @max_heap.length - 1

  # If the parent is larger than the value,
  # The item is in the correct position.
  while parent_idx >= 0 && @max_heap[parent_idx] < @max_heap[child_idx]
    # swap the values
    @max_heap[parent_idx], @max_heap[child_idx] = @max_heap[child_idx], @max_heap[parent_idx]
    child_idx = parent_idx
    parent_idx = (parent_idx - 1) / 2
  end
  @max_heap
end

# Sinking down, removing the min or max from a heap and replacing it.
def remove_max

  if @max_heap.length == 1
    return @max_heap.pop
  end

  # Replace the first element with the last element
  last_node = @max_heap.pop
  max_node = @max_heap.shift
  @max_heap.unshift(last_node)

  parent_idx = 0

  # Sink down the current first node to its correct position
  while parent_idx < @max_heap.length
    left_child_idx = (parent_idx * 2) + 1
    right_child_idx = (parent_idx * 2) + 2

    # Compare the values if the right and left child are in the correct index
    swap = nil
    if left_child_idx < @max_heap.length
        swap = left_child_idx if @max_heap[left_child_idx] > @max_heap[parent_idx]
    end

    if right_child_idx < @max_heap.length
      if swap.nil? && @max_heap[right_child_idx] > @max_heap[parent_idx] || swap != nil? && @max_heap[right_child_idx] > @max_heap[left_child_idx]
        swap = right_child_idx
      end
    end

    break if swap.nil?

    @max_heap[parent_idx], @max_heap[swap] = @max_heap[swap], @max_heap[parent_idx]

    parent_idx = swap

  end

  max_node
end



p insert(55)
p remove_max() # 55, [55, 39, 41, 18, 27, 12, 33]
p remove_max() #41, [41, 39, 33, 18, 27, 12]
p remove_max() #39, [39, 27, 33, 18, 12]
p remove_max() #33, [33, 27, 12, 18]
p remove_max() #27, [27, 18, 12]
p remove_max() #18, [18, 12]
p remove_max() #12, [12]
p remove_max() #nil [nil]