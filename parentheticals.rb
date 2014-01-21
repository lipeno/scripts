=begin
"Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."
Write a function that, given a sentence like the above, along with the position of an opening parenthesis,
finds the corresponding closing parenthesis.
Example: if the example string above is input with the number 10 (position of the first parenthesis),
the output should be 79 (position of the last parenthesis).
=end

def find_closing_parenthesis input_string, parenthesis_position
  @the_stack = []
  @largest = [] # also a stack
end

input = "Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."
puts find_closing_parenthesis input, 10











