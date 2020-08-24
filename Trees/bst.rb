# frozen_string_literal: true
require 'pry'
class Node
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class Bst
  attr_accessor :root
  def initialize
    @root = nil
  end

  def insert(value)
    new_node = Node.new(value)
    if @root.nil?
      @root = new_node
    else
      current_node = @root

      while current_node
        prev_node = current_node
        if current_node.value > value
          current_node = current_node.left
        elsif current_node.value < value
          current_node = current_node.right
        end
      end
      if prev_node.value > value
        prev_node.left = new_node
      else
        prev_node.right = new_node
      end
    end
  end
end

tree = Bst.new()
binding.pry