=begin
Make a simple benchmark method which takes in a block and calculates time it took to compute.
=end

def benchmark
  begin_time = Time.now
  yield
  end_time = Time.now
  end_time - begin_time
end

time_taken = benchmark do
  sleep 0.1
end
puts "Time taken #{time_taken}"


# Here is also an example of using ruby benchmark
require 'benchmark'
n=4000
Benchmark.bm do |benchmark|
  benchmark.report do
    a=[]; n.times { a = a + [n] }
  end
  benchmark.report do
    a=[]; n.times { a << n }
  end
  benchmark.report do
    a=[1..n].map {|number| number}
  end
end