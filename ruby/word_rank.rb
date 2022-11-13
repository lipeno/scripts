=begin
You are given a word as input: "WORD"

If we generate a list of all “words” (including duplicates) made up of the letters in "WORD" (in this case W, O, R and D),
in lexicographic order starting with DORW and ending with WROD, what position in the list will be occupied by the word "WORD"?
If the word occurs more than once, the first position should be returned.
=end

#def word_rank input
#  permutations = input.chars.to_a.permutation.to_a
#  joined_permutations = permutations.map { |permutation| permutation.join()}
#  sorted_permutations = joined_permutations.sort
#
#  return sorted_permutations.index(input) + 1
#end

def word_rank input
  perms = []
  permutations(input.chars.to_a) do |item|
    perms << item
  end
  joined_permutations = perms.map { |permutation| permutation.join()}
  sorted_permutations = joined_permutations.sort

  if sorted_permutations.index(input)
    return sorted_permutations.index(input) + 1
  end
end

def permutations array
  if array.size < 2
    yield array
  else
    array.each do |element|
      permutations(array.select() {|n| n != element}) {|val| yield([element].concat val)}
    end
  end
end


#def permutations(text, count)
#    if (count == text.length)
#      p text
#       $store.push text
#    else
#      for j in (count..text.length-1)
#        perm = text[count]          # Place next letter in spot k.
#        text[count] = text[j]
#        text[j] = perm
#
#        permutations(text, count+1)
#
#        perm = text[count]          # Put the old char back.
#        text[count] = text[j]
#        text[j] = perm
#
#      end
#    end
#end



#puts word_rank "W"
#puts word_rank ""
#puts word_rank "WORD"
puts word_rank "TURING"
puts word_rank "TURINGTU"