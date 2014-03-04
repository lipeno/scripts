=begin
One number is deleted from the sequence 1,2,3, ... N. You get the numbers in a random order, and have to find the deleted one. Preferably in O(N).
=end

def missing_number input
  n, numbers = input.split(":")
  length = n.to_i

  if numbers
    values = numbers.split(",").map { |number| number.to_i}

    total_sum = values.inject(0) {|sum, i|  sum + i }
    length_sum = (1..length).inject(0) {|sum, i|  sum + i }

    length_sum - total_sum
  else
    1
  end
end

p missing_number "8:1,2,3,4,5,6,8"
p missing_number "1"