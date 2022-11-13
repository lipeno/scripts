=begin
Implement a method to perform basic string compression using the counts of repeated characters.
For example, the string aabcccccaaa would become a2blc5a3. If the "compressed" string
would not become smaller than the original string, your method should return the original string.
=end

def compress_string str
  new_str = ''

  i = 0
  while i < str.length
    next_element = str[i+1]
    current = str[i]
    count = 1

    while next_element == current
      count += 1
      next_element = str[i+count]
    end

    new_str += current + count.to_s
    i += count
  end

  new_str
end

puts compress_string "aabcccccaaa"

