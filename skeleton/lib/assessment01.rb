require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    prc ||= Proc.new{|x,y| x + y}
    ev = accumulator
    accumulator ||= self[0]
    self.each_with_index do |x, idx|
      next if ev.nil? && idx == 0
      accumulator = prc.call(accumulator, x)
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2..num-1).each do |x|
    return false if num % x == 0
  end
  true
end

def primes(num)
  i = 2
  arr = []
  until arr.length == num
    arr << i if is_prime?(i)
    i += 1
  end
  arr
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  prev = factorials_rec(num-1)
  prev + [prev.last * (num-1)]
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new{[]}
    self.each_with_index do |x, idx|
      hash[x] += [idx]
    end
    hash.select{|_, y| y.length > 1}
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    arr = []
    (0..self.length-2).each do |x|
      (x+1..self.length-1).each do |y|
        str = self[x..y]
        arr << str if str == str.reverse
      end
    end
    arr
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if self.length < 2
    mid = self.length / 2
    sorted_left = self.take(mid).merge_sort(&prc)
    sorted_right = self.drop(mid).merge_sort(&prc)
    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    arr = []
    prc ||= Proc.new{|x,y| x <=> y}
    until left.empty? || right.empty?
      x, y = [left.first, right.first]
      case prc.call(x, y)
      when -1
        arr << left.shift
      when 0
        arr << left.shifit
      when 1
        arr << right.shift
      end
    end
    arr + left + right
  end
end
