# Using recursion and the is_a? method,
# write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

def deep_dup(arr)
  return self unless arr.is_a?(Array)
  result = []
  arr.each do |x|
    if x.is_a?(Array)
      result << deep_dup(x) 
    else
      result << x
    end
  end
  result
end
