require './linked_list.rb'

list = SinglyLinkedList.new(5)
list.add_to_beginning(3)
list.add_to_tail(4)
list.add_to_tail(5)
list.remove(5)
elem = 4
puts "Looking for element: ", elem , "Found: ", list.find(elem).data
puts "Displaying list contents at end:"
current_node = list.head
while current_node
  puts current_node.data
  current_node = current_node.next
end


def reverse linked_list
  current_node = linked_list.head


end