=begin
Assume you have a method isSubstring which checks if one word is a substring of another.
Given two strings, s i and s2, write code to check if s2 is a rotation of s1 using only one call
to isSubstring (e.g.,"waterbottle"is a rotation of "erbottlewat").
=end

def is_rotation str1, str2
  combined_str = str1 + str1 # The trick is to concatenate one string

  return is_substring combined_str, str2
end

def is_substring str1, str2
  if str1.include? str2
    return true
  else
    return false
  end
end

puts is_rotation "waterbottle", "erbottlewat"