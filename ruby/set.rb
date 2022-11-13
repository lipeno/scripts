# A collection that contains no duplicate elements.
# Sets contain no pairs of elements such that e1.equals(e2), and at most one null element.

class Set
  attr_reader :elements

  def initialize
    @elements = []
  end

  def add(element)
    @elements.push(element) if contains(element) == false
  end

  def contains(element)
    !@elements.index(element).nil?
  end

  def remove(element)
    @elements.delete(element)
  end

  def to_array
    @elements.flatten
  end

  def size
    @elements.size
  end

  def is_empty?
    @elements.size.zero?
  end

end