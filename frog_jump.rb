def solution(x, y, d)
  distance = y - x
  if distance % d == 0
    minimalNumberOfJumps = distance / d
  else
    minimalNumberOfJumps = distance / d + 1
  end
  puts minimalNumberOfJumps
end


solution(10, 85, 30)
# should return 3
solution(20, 100, 20)
# should return 4
