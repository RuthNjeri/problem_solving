require 'pry'

class Node
  attr_accessor :name, :children
  def initialize(name)
    @children = []
	  @name = name
  end 
  
  def add_child(name)
	@children.append(Node.new(name))
  end

  def depth_first_search(array) #["A", "B", "E", "F", "I", "J", "C", "D", "G", "K", "H"]
    array.push(self.name)
    unless self.children.empty?
      self.children.each do |child|
        child.depth_first_search(array)
      end
    end
    array
  end

  def bfs(arr)
    @queue = [self]

    until @queue.empty?
      current_node = @queue.shift
      arr << current_node.name

      unless current_node.children.empty?
        current_node.children.each do |child|
          @queue << child
        end
      end
    end
    arr
  end
end

graph = Node.new("A")
graph.add_child("B")
graph.add_child("C")
graph.add_child("D")
graph.children[0].add_child("E")
graph.children[0].add_child("F")
graph.children[0].children[1].add_child("I")
graph.children[0].children[1].add_child("J")
graph.children[2].add_child("G")
graph.children[2].add_child("H")
graph.children[2].children[0].add_child("K")

binding.pry

