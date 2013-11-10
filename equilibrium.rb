def solution(a)
    # write your code here...
  n = a.length
  equilibriumIndices = []
  sumLeft = 0;
  sumRight = 0;

  for p in 0..n-1
     sumLeft = sumLeft + a[p]
     sumRight = sumAll(a,p+1,n-1)
    if sumLeft == sumRight
      print "This one is equilibrium ", p
      return p
    end
  end

  return -1


end

def sumAll(a, from, to)
  sum = 0;
      for i in from..to
        sum = sum + a[i];
      end
  return sum;
end

solution([-7,1,5,2,-4,3,0])
