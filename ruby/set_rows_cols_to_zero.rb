=begin
Write an algorithm as such that if an element in an MxN matrix is 0, its entire row and column are set to 0.
=end

def set_to_zero matrix
  flag_rows = []
  flag_cols = []

  for i in 0..matrix.length-1
     for j in 0..matrix[i].length-1
       if matrix[i][j] == 0
         flag_rows.push i
         flag_cols.push j
       end
     end
  end

  flag_rows.each do |row|
    for i in 0..matrix[row].length-1
      matrix[row][i] = 0
    end
  end

  flag_cols.each do |col|
    for i in 0..matrix[col].length-1
      matrix[i][col] = 0
    end
  end

  return matrix

end

matrix = [[1,2,3,4],[1,0,3,4],[1,2,3,4],[1,2,3,0]]
puts (set_to_zero matrix).to_s