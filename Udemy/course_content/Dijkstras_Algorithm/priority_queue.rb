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

#  Because of sorting, it is O(n * logn)

binding.pry