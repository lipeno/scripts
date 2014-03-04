=begin
   Write function to compute Nth fibonacci number: F(n) = F(n-1) + F(n-2)
=end

def fibonacci (n)
  if n <= 1  # If n = 0, 1
    return n;
  else
   return fibonacci(n - 1) + fibonacci(n - 2);
  end
end

(0..35).each { |n| puts "for " + n.to_s + " it is " + fibonacci(n).to_s}