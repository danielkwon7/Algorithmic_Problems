#returns all subsets of an array
def subsets(array)
  return [[]] if array.empty?
  subs = subsets(array[0..-2])
  subs.concat(subs.map{|x| x += [array.last]})
end
