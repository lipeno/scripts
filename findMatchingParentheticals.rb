def findMatchingParentheticals(input, startingParanthesis)
  left_parens = 0
  position = startingParanthesis + 1
  for char in input[startingParanthesis+1, input.size-1].chars
      if char == '('
        left_parens += 1
      elsif char == ')'
            if left_parens == 0
                return position
            else
              left_parens = left_parens - 1
            end
      end
      position += 1
  end

  /* Alternative solution */
  #rightPartOfString = input[startingParanthesis, input.size-1]
  #numberOfLeftParanthesisAfterTarget = rightPartOfString.scan(/\(/m).size
  #
  #countRight = 0
  #for currentChar in startingParanthesis..input.size-1
  #  if (input[currentChar] == ")")
  #    countRight = countRight + 1
  #  end
  #
  #  if (countRight == numberOfLeftParanthesisAfterTarget)
  #    return currentChar + 1
  #  end
  #end

end

textInput = 'Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing.'
puts findMatchingParentheticals(textInput, 10)
# should return 79