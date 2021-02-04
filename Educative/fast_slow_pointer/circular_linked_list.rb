require 'pry'
class Node
  attr_accessor :next, :value
  def initialize(value, next_node = nil)
    @value = value
    @next = next_node
  end
end

# Fast and slow pointer can be used to detect a cycle.
# in a singly linked list.
class SinglyLinkedList
  attr_accessor :head
  def initialize(head = nil)
    @head = head
  end

  # With a fast and slow pointer,
  # They will always meet if it is a circular Linked List.
  # If not circular, they will never meet
  # O(n)T, O(1)S
  def has_cycle
    @slow, @fast = @head, @head

    while @fast&.next && !@fast.nil?
      @fast = @fast.next.next
      @slow = @slow.next
      if @fast == @slow
        return true
      end
    end
    false
  end

  # O(n) T | O(1) S
  def length_of_cycle
    cycle_present = has_cycle()
    return unless cycle_present

    counter = 1
    @fast = @fast.next
    while @fast != @slow
      counter += 1
      @fast = @fast.next
    end
    counter
  end

  # O(n)T | O(1)S
  def find_cycle_start
    cycle_length = length_of_cycle()

    pointer_1, pointer_2 = @head, @head

    while cycle_length > 0
      pointer_2 = pointer_2.next
      cycle_length -= 1
    end

    while pointer_1 != pointer_2
      pointer_1 = pointer_1.next
      pointer_2 = pointer_2.next
    end
    pointer_1.value
  end
end

head = Node.new(1)
head.next = Node.new(2)
head.next.next = Node.new(3)
head.next.next.next = Node.new(4)
head.next.next.next.next = Node.new(5)
head.next.next.next.next.next = Node.new(6)

linked_list = SinglyLinkedList.new(head)
puts "Linked List has cycle #{linked_list.has_cycle}" # => false

head.next.next.next.next.next.next = head.next.next
cycle_linked_list = SinglyLinkedList.new(head) # => true
puts "Linked List has cycle #{cycle_linked_list.has_cycle}"

head.next.next.next.next.next.next = head.next.next.next
cycle_linked_list_2 = SinglyLinkedList.new(head) # => true
puts "Linked List has cycle #{cycle_linked_list_2.has_cycle}" # => true

head.next.next.next.next.next.next = head.next.next.next
cycle_linked_list_3 = SinglyLinkedList.new(head)
p cycle_linked_list_3.length_of_cycle

p cycle_linked_list_3.find_cycle_start