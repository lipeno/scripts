=begin
Given an array of integer elements and an integer d please consider all the sequences of d consecutive elements in the array. For each sequence we compute the difference between the maximum and the minimum value of the elements in that sequence and name it the deviation.
Your task is to
write a function that computes the maximum value among the deviations of all the sequences considered above
print the value the standard output (stdout)
Note that your function will receive the following arguments:
v
which is the array of integers
d
which is an integer value giving the length of the sequences
=end

def find_deviation(v, d)
  max_deviation = 0
  until_num = d - 1
  while until_num < v.length
    arr = v[until_num - d + 1..until_num]
    deviation = arr.max - arr.min
    max_deviation = deviation if deviation > max_deviation

    until_num += 1
  end
  puts max_deviation
end

p find_deviation [6, 9, 4, 7, 4, 1], 3

