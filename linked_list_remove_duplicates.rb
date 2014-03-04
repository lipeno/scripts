require './linked_list.rb'

list = SinglyLinkedList.new("F")
list.add_to_tail("O")
list.add_to_tail("L")
list.add_to_tail("L")
list.add_to_tail("O")
list.add_to_tail("W")
list.add_to_tail("U")
list.add_to_tail("P")

puts "Displaying list contents at end:"
current_node = list.head
while current_node
  puts current_node.data
  current_node = current_node.next
end


def remove_duplicates linked_list
  current_node = linked_list.head
  letters = {}
  while current_node
    if letters[current_node.data]
      #linked_list.remove(current_node)
      current_node.next = current_node.next.next
    else
      letters[current_node.data] = true
    end

    current_node = current_node.next
  end

end