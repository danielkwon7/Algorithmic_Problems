# return b^n recursively. Your solution should accept negative values
# for n
def exponent(b, n)
  return 1 if n == 0
  b * exponent(b, n-1)
end
