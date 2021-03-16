require 'pry'
def merge_two_lists(l1, l2)

  node = nil

  if l1[0] > l2[0]
      node = l1
      node1 = l1[1]
  else
      node = l2
      node2 = l2[1]
  end
  head = node

  while !node1.nil? and !node2.nil?
      if node1.value > node2.value
          node.next = node1
          node1 = node1.next
      else
          node.next = node2
          node2 = node2.next
      end
  end

  while !node1.nil?
      node.next = node1
      node1 = node1.next
  end

  while !node2.nil?
      node.next = node2
      node2 = node2.next
  end
  head
end


p merge_two_lists([1,2,4], [1,3,4])