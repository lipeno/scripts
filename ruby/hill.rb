=begin
Given an array of integer elements
Your task is to
write a function that finds the minimum value X that makes possible the following: generate a new array that is sorted in strictly ascending order by increasing or decreasing each of the elements of the initial array with integer values in the [0, X] range.
Example: Having the initial array [5, 4, 3, 2, 8] the minimum value for X is 3. Decrease the first element (5) by 3, decrease the second one (4) by 1, increase the third one (3) by 1, increase the forth one (2) by 3 and do nothing to the last one (8). In the end we obtain the array [2, 3, 4, 5, 8] which is sorted in strictly ascending order.
print the result X to the standard output (stdout)
Note that your function will receive the following arguments:
v
which is the array of integers
=end

def hill(v)
  max_numbers = []
  last_index = v.length - 1
  sorted = v.sort

  for i in (0..last_index) do
    max_numbers.push (v[i] - sorted[i]).abs
  end

  puts max_numbers.max
end

hill [5, 4, 3, 2, 8]

hill [7, 3, 5, 6, 9, 4]

hill [3, 3, 2]