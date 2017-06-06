class Array

  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  def my_bsearch(target)
    return nil if self.empty?
    mid = self.length / 2
    left = self.take(mid).my_bsearch(target)
    right = self.drop(mid+1).my_bsearch(target)
    case self[mid] <=> target
    when -1
      return mid + 1 + right unless right.nil?
    when 0
      return mid
    when 1
      left
    end


  end

end
