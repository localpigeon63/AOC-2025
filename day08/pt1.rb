#generate all combinations and straight-line numbers (shrinking list each time to avoid duplicates, e.g. 2*30 and 30*2)
#(this is very inefficient, we'll see if I get away with it)
#what is a straight-line number and how to calculate? see saved chat
#store each pair of coordinates and the corresponding straight-line number in a hash
#order the hash by straight-line numbers (looks simple from google)
#iterate through the first 1000 entries
#for each, check whether any of the coordinates is stored in an array - it will be inside a sub-array, so something like arr.any?.include?
#if so, push coordinates to that array
#if not, initialise new array and store those coordinates in there (in a sub-array, so they still count as 1 item)
#after 1000 iterations done
#order overall array by sub-array length
#multiply together length of three largest items