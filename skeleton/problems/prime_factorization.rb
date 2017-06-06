# Write a recursive function that returns the prime factorization of
# a given number. Assume num > 1
#
# prime_factorization(12) => [2,2,3]
def prime_factorization(num)
  sum = []
  return [] if num == 0
  (2..num).each do |x|
    if is_prime?(x) && num % x == 0
      sum += [x] + prime_factorization(num/x)
    end 
  end
  sum
end

def is_prime?(num)
  (2...num).each{|x| return false if num % x == 0}
  true
end
