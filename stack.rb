class Stack
  def initialize
    @store = []
  end

  def push(item)
    @store.push item
  end

  def pop
    @store.pop
  end

  def size
    @store.length
  end
end