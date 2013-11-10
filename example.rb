def solution(number)
  numberToString = number.to_s
  stringReversed = numberToString.reverse

  decimalPlaces = ''
  if stringReversed.include? "."
    decimalPlaces, restOfString = stringReversed.split('.', 2)
  else
    restOfString = stringReversed
  end

  stringToDisplay = decimalPlaces
  if decimalPlaces != ''
    stringToDisplay = stringToDisplay + '.'
  end
  counter = 0
  restOfString.split("").each do |i|
    if counter % 3 == 0
      stringToDisplay =  stringToDisplay + ','
    end
    stringToDisplay =  stringToDisplay + i
    counter = counter + 1
  end

  stringToDisplay = stringToDisplay.reverse
  puts stringToDisplay
end

solution(123654.22)
#=123,654.22.
