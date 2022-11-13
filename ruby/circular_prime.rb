=begin
A number is called a circular prime if all of its rotations (rotations of their digits) are primes themselves.

For example the prime number 197 has two rotations: 971, and 719. Both of them are prime, so all of them are circular primes.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below N if 1 <= N <= 1000000?
=end

def num_of_circular_primes num
  circular_primes = 0
  if num < 2
    return circular_primes
  end

  (2..num-1).each do |number|
    if is_prime? number
      str = number.to_s
      str_combinations = (0...str.length).map do |i|
        (str * 2)[i, str.length]
      end
      int_combinations = str_combinations.collect{|i| i.to_i}

      all_combinations_which_are_prime = int_combinations.reject { |item| !is_prime? item }
      if all_combinations_which_are_prime.length == int_combinations.length
        circular_primes += 1
      end
    end
  end

  circular_primes
end

def is_prime? num #A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.
  last_divisor = num / 2
  (2..last_divisor).each do |x|
    return false if num % x == 0
  end
  return true
end

p num_of_circular_primes 100