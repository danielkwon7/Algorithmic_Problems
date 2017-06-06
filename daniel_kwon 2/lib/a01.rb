class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  def merge_sort(&prc)
    return self if self.length <= 1
    mid = self.length / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)
    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    prc ||= Proc.new{|x,y| x <=> y}
    result = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        result << left.shift
      when 0
        result << left.shift
      when 1
        result << right.shift
      end
    end
    result + left + right
  end

end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    array = []
    (0..self.length-2).each do |x|
      (x+1..self.length-1).each do |y|
        array << [x,y] if self[x] + self[y] == target
      end
    end
    array
  end
end

# Write a method that recursively finds the first `n` factorial numbers
# and returns them. N! is the product of the numbers 1 to N.
# Be aware that the first factorial number is 0!, which is defined
# to equal 1. The 2nd factorial is 1!, the 3rd factorial is 2!, etc.
# The "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
def factorials_rec(num)

  array = [1,1]
  return array[0..num-1] if num < 3
  prev = factorials_rec(num-1)
  prev + [prev.last * (num-1)]

end

class String
  # This method returns true if the string can be rearranged to form the
  # sentence passed as an argument.

  # Example:
  # "cats are cool".shuffled_sentence_detector("dogs are cool") => false
  # "cool cats are".shuffled_sentence_detector("cats are cool") => true

  def shuffled_sentence_detector(other)

    self.chars.sort == other.chars.sort

  end
end

def is_prime?(num)

  (2...num).none?{|x| num % x == 0}

end

# Write a method that returns the nth prime number
def nth_prime(n)
  array = []
  i = 2
  until array.length == n
    array << i if is_prime?(i)
    i += 1
  end
  array.last

end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)

    return self unless block_given?

    i = 0
    until i == self.length
      prc.call(self[i])
      i += 1
    end

    self
  end
end

class Array
  # Write an array method that calls the given block on each element and
  # combines each result one-by-one with a given accumulator. If no accumulator is
  # given, the first element is used.
  def my_inject(accumulator = nil, &prc)
    ev = accumulator
    accumulator ||= self.first
    prc ||= Proc.new{|x,y| x + y}
    self.each_with_index do |x, idx|
      next if ev.nil? && idx == 0
      accumulator = prc.call(accumulator, x)
    end
    accumulator
  end
end
