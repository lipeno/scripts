=begin
Print to the standard output a chessboard of size N,M where N is the number of columns and M is the number of rows.
You have to print a 0 where the board is white and a 1 otherwise.
Index (0,0) is white and it is the top left cell in the produced output.
=end

def chessboard input
  n,m = input.split(",").collect{|item| item.to_i}

  (0..m-1).each do |i|
    start = i % 2
    str = start.to_s
    (1..n-1).each do |j|
      if start == 0
        value = j % 2
      else
        value = (j+1) % 2
      end
      str += value.to_s
    end
    puts str
  end
end

chessboard "7,4"