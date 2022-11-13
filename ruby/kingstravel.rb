=begin
The king in chess can move to any neighboring square horizontally, vertically, or diagonally.
Assuming that the king starts on some square of an infinite chessboard, in how many different squares can it be after N moves?

N is at least 1.
=end

def kingstravel_fast(n)
   if n == 1
     8
   elsif n == 2
     25
   else
     25 + 8 * (3..n).inject{|sum,x| sum + x }
   end
end

def kingstravel_brute_force(position, moves)
  return [position] if moves == 0

  fields = []
  fields += kingstravel_brute_force([position.first + 1, position.last + 1], moves - 1)
  fields += kingstravel_brute_force([position.first + 1, position.last - 1], moves - 1)
  fields += kingstravel_brute_force([position.first - 1, position.last + 1], moves - 1)
  fields += kingstravel_brute_force([position.first - 1, position.last - 1], moves - 1)
  fields += kingstravel_brute_force([position.first + 1, position.last], moves - 1)
  fields += kingstravel_brute_force([position.first - 1, position.last], moves - 1)
  fields += kingstravel_brute_force([position.first, position.last + 1], moves - 1)
  fields += kingstravel_brute_force([position.first, position.last - 1], moves - 1)

  fields.uniq
end

x = "6"
puts kingstravel_fast x.to_i
puts kingstravel_brute_force([0, 0], x.to_i).count

x = "10000"
puts kingstravel_fast x.to_i
puts kingstravel_brute_force([0, 0], x.to_i).count