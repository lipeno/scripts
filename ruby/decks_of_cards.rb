=begin
In a casino all the playing cards got mixed up, and a lot of them got lost. You have to collect as many full decks as possible. A deck contains 52 cards, one for each rank and suit.

You get N mixed up French playing cards as your input.

You have to output the number of full decks.

The cards are of the following ranks:
2,3,4,5,6,7,8,9,T,J,Q,K,A

The four suits are:
Spade(♠), Club(♣), Heart(♥), and Diamond(♦)

The cards are given using their rank followed by their suit:

2 of Spades: 2S
Ace of Clubs: AC
10 of Hearts: TH
=end

def decks_of_cards input
  arr = input.split(",")
  ranks = "2,3,4,5,6,7,8,9,T,J,Q,K,A".split(",")
  suits = "S,C,H,D".split(",")

  count = 0

  while arr.any?
    ranks.each do |rank|
      suits.each do |suit|
        elem = rank + suit
        unless arr.include?(elem)
          return count
        end
        arr.delete_at(arr.index(elem) || arr.length)
      end
    end

    count += 1
  end

  return count
end


x = "5C,5C,2S,JS,TC,JC,2H,9C,QH,2D,7H,2H,QS,KD,3D,4C,QS,8S,8H,5H,7D,9D,QH,5C,TD,KS,AH,3C,AS,4C,6C,TH,KC,AH,AC,2C,JC,4S,QD,4C,9S,KD,8C,TC,TS,AC,TC,JH,9D,3D,TH,7H,7D,KH,QC,2D,KH,AH,JH,TC,JS,6H,3C,TS,TH,TC,TC,4D,KC,QD,9D,3D,4C,TD,7H,5S,8S,8C,6S,TD,KC,5S,7S,6S,4H,4H,3D,QC,6S,AC,AD,3H,TC,5H,6C,2H,6S,6S,6H,4C,7H,8D,4D,TH,JC,AH,2H,7C,AD,2H,6D,KD,6C,7D,5D,QS,QD,TS,5S,2H,5H,3H,3S,3D,2H,3H,JD,3C,7C,4S,AC,KS,9C,8D,2C,KH,2D,6C,TC,JS,AD,KC,5C,9H,AC,9H,QS,8H,2H,7D,TS"
p decks_of_cards x