def findAnagrams(word, file)
  wordsfromFile = file.split(" ")

  lettersOfParameter = word.split("")
  listOfAnagrams = []

  wordsfromFile.each do |currentWord|
    if isAnagram(word, currentWord) == true
      listOfAnagrams.push(currentWord)
    end
  end

  puts "Found anagrams:"
  puts listOfAnagrams

end

def isAnagram(word1, word2)
  firstWord = String.new(word1);
  secondWord = String.new(word2);

  for i in 0..firstWord.length
    for j in 0..secondWord.length
      if firstWord[i]==secondWord[j]
        #word1.chars.sort == word2.chars.sort
        secondWord.slice!(j) # delete char at specific index position
      end
    end
  end

  if secondWord.length == 0
    return true
  else
    return false
  end

end

someFile = "relay bla rabsie layer jesus"
findAnagrams("early", someFile)
