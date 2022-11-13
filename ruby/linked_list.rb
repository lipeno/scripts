=begin
My implementation of a (singly) linked list.
It uses node data structure that contains data and next pointer.
List has a head pointer refering to the first node in the list (or null for an empty list).
=end

class Node
  attr_accessor :next, :data

  def initialize data
    @next = nil # The field of each node that contains the address of the next node is usually called the next link or next pointer.
    @data = data # This is the key of the value of the node
  end

  def to_s
    @data
  end
end

class SinglyLinkedList
  attr_accessor :head # The head of a list is its first node.

  def initialize(first_value=nil)
    @head = Node.new(first_value) if first_value
  end

  # Splices an element onto the front of the linked list
  # Arguments: *item* => Value to store in the element to be inserted
  def add_to_tail (data)
    new_element = Node.new (data)
    if @head.nil?
      @head = new_element
    else
      current_node = @head
      while current_node.next
        current_node = current_node.next
      end
      current_node.next = new_element
    end
  end

  def add_to_beginning (data) # insert node before current first node
    new_element = Node.new (data)
    new_element.next = @head
    @head = new_element
  end

  # Removes the first element with given data from the linked list
  def remove (data)
    if @head.data == data
      @head = @head.next # Move head to the next node
    else
      current_node = @head.next # Go the next element
      prev_node = @head
      while current_node
        if current_node.data == data
          prev_node.next = current_node.next
          return @head # Head didnt change
        end
        prev_node = current_node
        current_node = current_node.next
      end

      return @head
    end
  end

  # Find node with given value
  def find (data)
    current_node = @head

    while current_node
      return current_node if current_node.data == data
      current_node = current_node.next
    end

    return nil
  end

  # Traverse through the list
  def display
    current = @head
    full_list = []
    while current.next != nil
      full_list += [current.data.to_s]
      current = current.next
    end
    full_list += [current.data.to_s]
    puts full_list.join("->")
  end
end