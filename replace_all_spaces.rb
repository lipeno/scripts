=begin
Write a method to replace all spaces in a string with '%20'. Yo umay assume that the string has sufficient space
at the end of the string to hold the additional characters,
and that you are given the "true" length of the string.
=end

def replace_spaces_1 str
  str2 = str.split(" ")
  str2.join("%20")
end

def replace_spaces_2 str
  i = str.length - 1
  while i > 0
    if str[i] == " "
       str[i] = "%20"
    end
    i -= 1
  end
  str
end

puts replace_spaces_1 "hello world today"
puts replace_spaces_2 "hello world today"