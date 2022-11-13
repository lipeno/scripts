def max_product(a)
  a = a.sort()
  len = a.length
  three_largest = a[len - 1] * a[len - 2] * a[len - 3]
  two_lowest_and_one_largest = a[0] * a[1] * a[len - 1]
  three_largest > two_lowest_and_one_largest ? three_largest : two_lowest_and_one_largest
end

max_product([-3, 1, 2, -2, 5, 6]) # 60