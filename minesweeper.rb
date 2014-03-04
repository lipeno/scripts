=begin
  Calculate the number of mines in the surrounding cells for every cell in the field.
=end

def calculate_number str
  lines = str.split("\n").map do |line|
    line.split(" ").map { |item| item == "O" ? 0:item } # There are "O" in input and not zeroes (0) so let's convert them appropriately
  end

  (0..lines.length-1).each do |row_num|
    (0..lines[row_num].length-1).each do |col_num|
      item = lines[row_num][col_num]
      if item == "X"
        start_row = row_num == 0 ? 0 : row_num-1
        end_row = row_num == lines.length-1 ? lines.length-1 : row_num+1

        start_col = col_num == 0 ? 0 : col_num-1
        end_col = col_num == lines[row_num].length-1 ? lines[row_num].length-1 : col_num+1

        (start_row..end_row).each do |i|
          (start_col..end_col).each do |j|
            if lines[i] && lines[i][j] && lines[i][j] != "X"
              lines[i][j] = lines[i][j].to_i + 1
            end
          end
        end
      end
    end
  end

  newArray = []
  (0..lines.length-1).each do |row_num|
    newArray.push lines[row_num].join(" ")
  end

  puts newArray.join("\n")
end

str = "O O O O X O O O O O
X X O O O O O O X O
O O O O O O O O O O
O O O O O O O O O O
O O O O O X O O O O"
calculate_number str