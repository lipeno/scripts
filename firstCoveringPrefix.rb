#unifinished
def solution(a)
  n = a.length
  coveredArray = []

  for i in 0..n-1
    if coveredArray[a[i]] == true

      print i
      return i
    else
      coveredArray[a[i]] = true
    end

  end

end

solution([2,2,1,0,1])
