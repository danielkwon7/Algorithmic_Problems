# Write a recursive method that returns all of the permutations of an array
def permutations(array)
  return [array] if array.length <= 1
  result = []
  first = array.shift
  perms = permutations(array)

  perms.each do |perm|
    perm.length.times do |idx|
      result << perms[0...idx] + [first] + perms[idx..-1]
    end
  end
  result.sort
end
