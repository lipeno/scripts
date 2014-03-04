=begin
"Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing."
Write a function that, given a sentence like the above, along with the position of an opening parenthesis,
finds the corresponding closing parenthesis.
Example: if the example string above is input with the number 10 (position of the first parenthesis),
the output should be 79 (position of the last parenthesis).
=end

def findMatchingParentheticals(input, starting_parenthesis_index)
  number_of_opened = 1
  position = starting_parenthesis_index + 1

  (starting_parenthesis_index + 1 .. input.size-1).each do |i|
    if input[i] == '('
      number_of_opened += 1
    elsif input[i] == ')'
      number_of_opened = number_of_opened - 1
      if number_of_opened == 0
        return position
      end
    end
    position += 1
  end
end

textInput = 'Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing.'
puts findMatchingParentheticals textInput, 10 # should return 79