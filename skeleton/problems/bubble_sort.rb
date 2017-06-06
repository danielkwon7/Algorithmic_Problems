class Array
  def bubble_sort!
    self.bubble_sort!
  end

  def bubble_sort!(&prc)
    prc ||= Proc.new{|x,y| x <=> y}
    sorted = false
    until sorted
      sorted = true
      (0..self.length-2).each do |idx|
        if prc.call(self[idx], self[idx+1]) == 1
          sorted = false 
          self[idx], self[idx+1] = self[idx+1], self[idx]
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    arr = self.dup
    arr.bubble_sort!(&prc)
    arr
  end
end
