function palindromes(words) {
  var palindromesString = "";
  var index;
  for (index = 0; index < words.length; ++index) {
    palindrome = words[index].split('').reverse().join('');
    if (palindrome == words[index]) {
      palindromesString = palindromesString + "T";
    }
    else{
      palindromesString = palindromesString + "F";
    }
  }
  console.log(palindromesString);
}

palindromes(["radar", "apple", "hello", "evitative"])