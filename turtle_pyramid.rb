=begin
Turtles would like to create a pyramid, where every turtle in the pile can only be on top of a larger turtle. The only move they can make is crawling out and then crawling on top. Since they're having a problem achieving this configuration, they ask you to write a program that can tell them in which order to move. You have to advise them, so that it takes the least amount of moves to rearrange.

There are N turtles, represented by their size as numbers in the interval [1, N] (1 and N included). For example: N=3 means there are 3 turtles, and their sizes are: 1, 2, 3.
=end

def turtles input
  stack = input.split("\n")
  stack.reverse!

  (0..stack.length-1).each do |num|
    part_of_stack = stack[0..stack.length - 1 - num]
    max = part_of_stack.max
    index_of_max = stack.index(max)
    if part_of_stack.length == 1 || index_of_max != part_of_stack.length-1
      stack.delete_at(index_of_max)
      stack.push max
      puts max
    end
  end
end

x = "5\n1\n3\n2\n4"
turtles x