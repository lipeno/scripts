=begin
Write a function to reverse an array of characters (string) in place.
"In place" means "without creating a new string in memory."
=end

def reverse_in_place input_string
  middle_index = input_string.length / 2
  last_index = input_string.length - 1

  (0..middle_index-1).each do |i|
    temp = input_string[i]
    input_string[i] = input_string[last_index - i]
    input_string[last_index - i] = temp
  end

  input_string
end

puts reverse_in_place "melody"
puts reverse_in_place "hello"
puts reverse_in_place "solitaire"









