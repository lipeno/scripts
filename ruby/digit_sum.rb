=begin
Find the sum of the digits of all the numbers from 1 to N (both ends included).

For N = 10 the sum is 1+2+3+4+5+6+7+8+9+(1+0) = 46

Preferably in O(logN) time. N is at least 1.
=end

def digit_sum n
  sum = 0
  (1..n).each do |digit|
    if digit < 10
      sum += digit
    else
      digits = digit.to_s.chars.map(&:to_i)
      digits_sum = digits.inject{|sum,x| sum + x }
      sum += digits_sum
    end
  end

  return sum
end

p digit_sum 1000