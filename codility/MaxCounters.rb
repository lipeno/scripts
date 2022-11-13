def max_counters(n,a)
  counters = []
  (1..n).each do |index|
    counters.push 0
  end
  a.each do |elem|
    if elem >= 1 && elem <= n
      counters[elem] += 1
          result[command-1] = max_counter
      result[command-1] += 1
      if current_max < result[command-1]:
          current_max = result[command-1]
    elsif elem == n + 1
      max = counters.max
      counters.each do |counter|
        counter = max
      end
    end
  end
  counters

end

p max_counters(5,[3, 4, 4, 6, 1, 4, 4])