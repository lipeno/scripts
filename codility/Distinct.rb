def distinct(a)
  return 0 if a.length == 0
  a.sort!
  count = 1
  a.each_index do |index|
    count += 1 if index > 0 && a[index-1] != a[index]
  end
  count
end

distinct [1,2,4,5,1,2,1] # 4