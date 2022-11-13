=begin
Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?
=end

def has_all_unique str # By using sorting algorithm

str = str.chars.sort
  last = nil
  for i in 0..str.length
    if last == str[i]
      return false
    end

    last = str[i]
  end

  return true

end

def has_all_unique_2 str # By using a hash table
  set_of_chars = {}
  for i in 0..str.length
    val = str[i]

    if set_of_chars[val]
      return false
    end

    set_of_chars[val] = true
  end

  return true

end

puts has_all_unique "dohave"
puts has_all_unique "doesnthave"

puts has_all_unique_2 "dohave"
puts has_all_unique_2 "doesnthave"
