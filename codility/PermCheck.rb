def perm_check a
  if a.length == 0
    return 0
  end

  largest = 0
  a.each do |elem|
     if largest < elem
       largest = elem
     end
  end

  arithm_seq = (1..largest).to_a
  sum_of_arithmetic_sequence = arithm_seq.length * (arithm_seq.first + arithm_seq.last) / 2
  sum_of_array = a.inject(0) {|sum, elem| sum + elem}

  if sum_of_array == sum_of_arithmetic_sequence
    return 1
  else
    return 0
  end
end

p perm_check([4, 1, 3, 2])

p perm_check([])