=begin
Reverse words in a string (words are separated by on or more spaces). Now do it in-place.
=end

def reverse_words_in_string str
  str.reverse.scan(/[\w]+/).collect { |w| w.reverse}.join(" ")
end

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

def reverse_words_in_string_in_place str
#  Reverse the whole string first
  middle_index = str.length / 2
  last_index = str.length - 1

  (0..middle_index-1).each do |i|
    temp = str[i]
    str[i] = str[last_index - i]
    str[last_index - i] = temp
  end

#  Now reverse each word in this new string
  index = 0
  while index < str.length
    if str[index] == " "
       last = 0 unless last
       str[last..index] = reverse_in_place(str[last..index-1]) + " "
       last = index + 1
    end
    if index == str.length-1
      last = 0 unless last
      str[last..index] = reverse_in_place(str[last..index])
    end
    index += 1
  end
  str
end

puts reverse_words_in_string "ok mindbrake is awesome"
puts reverse_words_in_string "hello mr jack"

puts reverse_words_in_string_in_place "ok mindbrake is awesome"
puts reverse_words_in_string_in_place "hello mr jack"