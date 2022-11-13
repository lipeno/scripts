=begin
I have an array where every number in the range 1...n appears once except for one number which appears twice.
Write a function for finding the number that appears twice.
=end

def findNumber numbers, n
  numbers_sum = 0
  numbers.each do |num|
    numbers_sum += num
  end

  total_sum = 0
  (1..n).each do |num|
    total_sum += num
  end

  return numbers_sum - total_sum
end

n = 8
numbers = [2, 4 ,7, 3, 1, 8, 3, 5, 6]
puts findNumber numbers, n
