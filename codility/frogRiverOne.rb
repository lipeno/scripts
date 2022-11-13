def frog_river(x, a)
  leaf_at_position = {}
  count_steps = 0

  a.each_with_index do |item, i|
    if (item <= x && !leaf_at_position[a[i]])  # If a leaf is on a way to position and it is the first time so it has not been tracked yet
      leaf_at_position[a[i]] = true
      count_steps += 1
    end
    if (count_steps === x) # If all the positions from zero to the last leaf have been filled, return the index of the element as it represents time
      return i;
    end
  end
  return -1;
end

p frog_river(5, [1, 3, 1, 4, 2, 3, 5, 4])
