def palindrome?(word)
is = false
word = word.downcase
word = word.gsub(/[^a-z]/i, "")
reversed = word.reverse
  
if word == reversed then is = true
end

if is == true then return true
else return false
end

end


p palindrome?("A man, a plan, a canal -- Panama") #=> true
p palindrome?("Madam, I'm Adam!") # => true
p palindrome?("Abracadabra") # => false (nil is also ok)


def count_words(word)
is = false;
word = word.downcase;
hash = Hash.new(0)

word.gsub(/[^a-zA-Z]/, ' ').split.each do |string|
hash[string] += 1
end

return hash
end

p count_words("A man, a plan, a canal -- Panama") # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1,'plan' => 1}
p count_words "Doo bee doo bee doo" # => {'doo' => 3, 'bee' =>2}
