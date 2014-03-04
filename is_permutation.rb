#Given two strings, write a method to decide if one is a permutation of the other.

# lets assume that comparison is case sensitive and whitespace is significant
def is_permutation str1, str2
  if str1.length != str2.length
    return false
  end
  if str1.chars.sort == str2.chars.sort
    return true
  end

  return false
end

# Each string has same amount of each of the characters in it
def is_permutation2 str1, str2
  if str1.length != str2.length
    return false
  end

  letters = {}

  str1.chars.each do |char|
    if !letters[char]
      letters[char] = 1
    end
    letters[char] += 1
  end

  str2.chars.each do |char|
    #if letters[char] < 1
    #  return false
    #end
    letters[char] -= 1
    if (letters[char] < 0)
      return false
    end
  end

  return true
end


puts is_permutation "main", "naim"
puts is_permutation "car", "bike"
puts is_permutation2 "main", "naim"
puts is_permutation2 "car", "bike"