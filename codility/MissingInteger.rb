def missing_integer a
  occurrence = []
  a.each do |item|
    occurrence[item] = true if 1 <= item && item <= a.length + 1
  end
  (1..(a.length + 1)).each do |index|
    return index unless occurrence[index] == true
  end
  return -1
end

p missing_integer [1, 3, 6, 4, 1, 2]