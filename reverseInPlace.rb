=begin
Write a function to reverse an array of characters in place.
"In place" means "without creating a new string in memory."
=end

def reverse_in_place input_string
  middle_index = input_string.length / 2
  has_odd_length = false
  has_odd_length = true if input_string.length % 2 == 1

  left_element_index = middle_index - 1
  right_element_index = middle_index
  right_element_index = middle_index + 1 if has_odd_length

  for i in (0..middle_index-1)
    temp = input_string[left_element_index - i]
    input_string[left_element_index - i] = input_string[right_element_index + i]
    input_string[right_element_index + i] = temp
  end

  input_string
end

puts reverse_in_place "melody"
puts reverse_in_place "hello"
puts reverse_in_place "solitaire"









