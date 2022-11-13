# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
  n = a.size
  passing_cars = 0

  suffix_sums = Array.new(n + 1, 0)

  a.reverse.each_with_index do |elem, i|
    suffix_sums[i + 1] = suffix_sums[i] + elem
  end
  suffix_sums.reverse!

  a.each_with_index do |car, i|
    if car == 0
      passing_cars += suffix_sums[i]
    end
  end

  passing_cars > 1_000_000_000 ? -1 : passing_cars
end

p solution [0, 1, 0, 1, 1]