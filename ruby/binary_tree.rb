class BinaryTree

  attr_accessor :left
  attr_accessor :right
  attr_accessor :data

  def initialize(new_data=nil)
    @left = nil
    @right = nil
    @data = new_data
  end

  def size # It recursively calls size on each of the nodes and when the node doesnt have any children nodes it returns size 1
    size = 1
    size += @left.size unless @left.nil?
    size += @right.size unless @right.nil?
    size
  end

  def insert(new_data)
    list = []
    if @data == nil # We first fill left and right side and only when they are full, new children nodes are created
      @data = new_data
    elsif @left == nil
      @left = BinaryTree.new(new_data)
    elsif @right == nil
      @right = BinaryTree.new(new_data)
    else
      list << @left
      list << @right
      loop do
        node = list.shift
        if node.left == nil
          node.insert(new_data)
          break
        else
          list << node.left
        end
        if node.right == nil
          node.insert(new_data)
          break
        else
          list << node.right
        end
      end
    end
  end

  def all
    data = []

    data << @left.all unless @left.nil?
    data << @data
    data << @right.all unless @right.nil?

    data.flatten
  end

  def traverse
    list = []
    yield @data
    list << @left unless @left.nil?
    list << @right unless @right.nil?
    loop do
      break if list.empty?
      node = list.shift
      yield node.data
      list << node.left unless node.left.nil?
      list << node.right unless node.right.nil?
    end
  end

end


tree = BinaryTree.new

[1, 2, 3, 4, 5, 6, 7].each { |x| tree.insert(x) }

tree.traverse { |x| print "#{x} " }; print "\n"

p tree.size
p tree.all


