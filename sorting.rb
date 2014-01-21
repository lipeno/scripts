# Sample implementation of quicksort and mergesort in ruby
# Both algorithm sort in O(n * lg(n)) time
# Quicksort works inplace, where mergesort works in a new array

def quicksort(array, from=0, to=nil)
  if to == nil
    # Sort the whole array, by default
    to = array.count - 1
  end

  if from >= to
    # Done sorting
    return
  end

  # Take a pivot value, at the far left
  pivot = array[from]

  # Min and Max pointers
  min = from
  max = to

  # Current free slot
  free = min

  while min < max
    if free == min # Evaluate array[max]
      if array[max] <= pivot # Smaller than pivot, must move
        array[free] = array[max]
        min += 1
        free = max
      else
        max -= 1
      end
    elsif free == max # Evaluate array[min]
      if array[min] >= pivot # Bigger than pivot, must move
        array[free] = array[min]
        max -= 1
        free = min
      else
        min += 1
      end
    else
      raise "Inconsistent state"
    end
  end

  array[free] = pivot

  quicksort array, from, free - 1
  quicksort array, free + 1, to
end

def mergesort(array)
  if array.count <= 1
    # Array of length 1 or less is always sorted
    return array
  end

  # Apply "Divide & Conquer" strategy

  # 1. Divide
  mid = array.count / 2
  part_a = mergesort array.slice(0, mid)
  part_b = mergesort array.slice(mid, array.count - mid)

  # 2. Conquer
  array = []
  offset_a = 0
  offset_b = 0
  while offset_a < part_a.count && offset_b < part_b.count
    a = part_a[offset_a]
    b = part_b[offset_b]

    # Take the smallest of the two, and push it on our array
    if a <= b
      array << a
      offset_a += 1
    else
      array << b
      offset_b += 1
    end
  end

  # There is at least one element left in either part_a or part_b (not both)
  while offset_a < part_a.count
    array << part_a[offset_a]
    offset_a += 1
  end

  while offset_b < part_b.count
    array << part_b[offset_b]
    offset_b += 1
  end

  return array
end

# Search a sorted array in O(lg(n)) time
def binary_search(array, value, from=0, to=nil)
  if to == nil
    to = array.count - 1
  end

  mid = (from + to) / 2

  if value < array[mid]
    return binary_search array, value, from, mid - 1
  elsif value > array[mid]
    return binary_search array, value, mid + 1, to
  else
    return mid
  end
end

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].shuffle
# Quicksort operates inplace (i.e. in "a" itself)
# There's no need to reassign
quicksort a
puts "quicksort"
puts a

b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15].shuffle
# Mergesort operates in new array
# So we need to reassign
b = mergesort b
puts "mergesort"
puts b

offset_3 = binary_search a, 3
puts "3 is at offset #{offset_3} in a"

offset_15 = binary_search b, 15
puts "15 is at offset #{offset_15} in b"