class MaxBinaryHeap
  attr_accessor :values

  def initialize(values = [])
    @values = values
  end

  def insert(node)
    @values.push(node)
    bubble_up(@values)
  end

  def bubble_up(@values)
    index = @values.length - 1
    parentIndex 
  end

end
