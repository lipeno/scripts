=begin
Write an extended stack class that has a function getLargest() for returning the largest element in the stack.
=end

class ExtendedStack
  def initialize
    @the_stack = []
    @largest = [] # also a stack
  end

  def push(item)
    @the_stack.push item
    if @largest == []
      @largest.push item
    else
      element = @largest.pop
      @largest.push element
      if element < item
        @largest.push item
      end
    end
  end

  def pop
    item = @the_stack.pop
    if item == self.getLargest
      @largest.pop
    end
    return item
  end

  def getLargest
    item = @largest.pop
    @largest.push item
    return item
  end
end

my_stack = ExtendedStack.new
my_stack.push 4
my_stack.push 9
my_stack.push 20
my_stack.push 100
my_stack.push 2
my_stack.push 720
puts my_stack.getLargest











