def is_triangular? a
  # A triplet (P, Q, R) is triangular if 0 ≤ P < Q < R < N and:
  #     A[P] + A[Q] > A[R],
  #     A[Q] + A[R] > A[P],
  #     A[R] + A[P] > A[Q]
  a.sort!
  # # it is sorted so a[P] < a[Q] < a[R] so we only need to check for A[P] + A[Q] > A[R]
  return 0 if a.length < 3
  a.each_with_index do |elem, index|
    if index <= a.length - 3
      p = a[index]
      q = a[index + 1]
      r = a[index + 2]
      return 1 if r < p + q
    end
  end
  return 0
end

p is_triangular? [4, 3, 4] # 1



