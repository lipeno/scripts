=begin
Implement a queue ↴ with 2 stacks ↴ .
Your queue should have an enqueue and a dequeue function and it should be "first in first out" (FIFO).
Optimize for the time cost of m function calls on your queue. These can be any mix of enqueue and dequeue calls.
Assume you already have a stack implementation and it gives O(1) time push and pop.
=end

require './stack.rb'

class Queue
  def initialize
    @stack1 = Stack.new
    @stack2 = Stack.new
  end

  def dequeue
    if @stack2.size > 0
      @stack2.pop
    else
      if @stack1.size > 0
        for i in (0..@stack1.size-2) # Leave the last one
          @stack2.push(@stack1.pop)
        end
        @stack1.pop
      end
    end
  end

  def enqueue(element)
    @stack1.push element
  end

  def size
    @stack1.size + @stack2.size
  end
end

queue = Queue.new
queue.enqueue("a")
queue.enqueue("b")
queue.enqueue("c")
puts "should be a == " + queue.dequeue
queue.enqueue("d")
puts "should be b == " + queue.dequeue
queue.enqueue("e")
puts "should be c == " + queue.dequeue
queue.enqueue("f")
puts "should be d == " + queue.dequeue
puts "should be e == " + queue.dequeue
puts "should be f == " + queue.dequeue







