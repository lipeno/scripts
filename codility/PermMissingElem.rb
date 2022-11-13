def solution(a)
  p array_sum = a.inject(0) {|sum, i|  sum + i }
  p total_sum = (a.length + 1)*(a.length + 2) / 2
  i = 0
  while (i < a.length) do
    total_sum -= a[i]
    i += 1
  end
  return total_sum
end

p solution [2, 3, 1, 5]