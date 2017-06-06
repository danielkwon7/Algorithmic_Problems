# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  result = [1]
  return result if num == 1
  prev = factorials_rec(num-1)
  result = prev + [prev.last * num-1]

end
