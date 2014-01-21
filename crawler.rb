=begin
Problem:
I wrote a crawler that visits web pages, stores a few keywords in a database, and follows links
to other web pages. I noticed that my crawler was wasting a lot of time visiting the same pages over and over,
so I made a hash table visited where I'm storing URLs I've already visited. Now the crawler only visits a URL
if it hasn't already been visited.
Thing is, the crawler is running on my old desktop computer in my parents' basement
(where I totally don't live anymore), and it keeps running out of memory because visited is getting so huge.
How can I trim down the amount of space taken up by visited?
=end

=begin
Solution:
We can use a trie, a nested hash map where each map has keys of just one character.
So we would store 'google.com' as visited['g']['o']['o']['g']['l']['e']['.']['c']['o']['m']['*'] = True.
The '*' at the end means 'this is the end of an entry'. Otherwise we wouldn't know
what parts of visited are real URLs and which parts are just prefixes.
We can visualize this as a tree, where each node is a character. We can even implement it with
node objects and edge pointers instead of nested hash maps.
=end