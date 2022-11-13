# Generates a random web link structure, and finds the
# corresponding PageRank vector.  The number of inbound
# links for each page is controlled by a power law
# distribution.
#
# This code should work for up to a few million pages on a
# modest machine.
#
# Written and tested using Python 2.5.

import numpy
import random

class web:
  def __init__(self,n):
    self.size = n
    self.in_links = {}
    self.number_out_links = {}
    self.dangling_pages = {}
    for j in xrange(n):
      self.in_links[j] = []
      self.number_out_links[j] = 0
      self.dangling_pages[j] = True

def paretosample(n,power=2.0):
  '''Returns a sample from a truncated Pareto distribution
  with probability mass function p(l) proportional to
  1/l^power.  The distribution is truncated at l = n.'''
  m = n+1
  while m > n: m = numpy.random.zipf(power)
  return m

def random_web(n=1000,power=2.0):
  '''Returns a web object with n pages, and where each
  page k is linked to by L_k random other pages.  The L_k
  are independent and identically distributed random
  variables with a shifted and truncated Pareto
  probability mass function p(l) proportional to
  1/(l+1)^power.'''
  g = web(n)
  for k in xrange(n):
    lk = paretosample(n+1,power)-1
    values = random.sample(xrange(n),lk)
    g.in_links[k] = values
    for j in values:
      if g.number_out_links[j] == 0: g.dangling_pages.pop(j)
      g.number_out_links[j] += 1
  return g

def step(g,p,s=0.85):
  '''Performs a single step in the PageRank computation,
  with web g and parameter s.  Applies the corresponding M
  matrix to the vector p, and returns the resulting
  vector.'''
  n = g.size
  v = numpy.matrix(numpy.zeros((n,1)))
  inner_product = sum([p[j] for j in g.dangling_pages.keys()])
  for j in xrange(n):
    v[j] = s*sum([p[k]/g.number_out_links[k] for k in g.in_links[j]])+s*inner_product/n+(1-s)/n
  # We rescale the return vector, so it remains a
  # probability distribution even with floating point
  # roundoff.
  return v/numpy.sum(v)  

def pagerank(g,s=0.85,tolerance=0.00001):
  '''Returns the PageRank vector for the web g and
  parameter s, where the criterion for convergence is that
  we stop when M^(j+1)P-M^jP has length less than
  tolerance, in l1 norm.'''
  n = g.size
  p = numpy.matrix(numpy.ones((n,1)))/n
  iteration = 1
  change = 2
  while change > tolerance:
    print "Iteration: %s" % iteration
    new_p = step(g,p,s)
    change = numpy.sum(numpy.abs(p-new_p))
    print "Change in l1 norm: %s" % change
    p = new_p
    iteration += 1
  return p

print '''Now computing the PageRank vector for a random
web containing 10000 pages, with the number of inbound
links to each page controlled by a Pareto power law
distribution with parameter 2.0, and with the criterion
for convergence being a change of less than 0.0001 in l1
norm over a matrix multiplication step.'''

g = random_web(10000,2.0) # works up to several million
                          # pages.
pr = pagerank(g,0.85,0.0001)
print pr