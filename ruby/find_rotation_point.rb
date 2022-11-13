=begin
I opened up a dictionary to a page in the middle and started flipping through,
looking for words I didn't know. I decided to start placing them at increasing
indices in a huge array I created in memory. When I reached the end of the dictionary,
I started from the beginning and did the same thing until I reached the page I had started at.
Now I have an array of words that are mostly alphabetical, except they start somewhere in
the middle of the alphabet, reach the end, and then start from the beginning of the alphabet.
In other words, this is an alphabetically ordered array that has been "rotated."
Write a function for finding the "rotation point," which is where I started working from
the beginning of the dictionary. This array is huge (there are lots of words I don't know)
so we want to be efficient here.
=end

def findRotationPoint(huge_array)
  first, floor = [0 , 0] # both are zero
  ceiling = huge_array.length - 1
  # Binary search
  while(floor < ceiling)
    guess = floor + ((ceiling - floor) / 2)

    # if guess comes before first word, go right
    if huge_array[guess] > huge_array[first]
      floor = guess
    # if guess is alphabetically before first word, go left
    else
      ceiling = guess
    end

    # if floor and ceiling have converged
    if floor + 1 == ceiling
      # between floor and ceiling is where we flipped to the beginning
      return ceiling
    end
  end
end

puts findRotationPoint(["garden", "heroes", "reign", "severance", "ant", "boiling", "burned", "going", "herbal"])
