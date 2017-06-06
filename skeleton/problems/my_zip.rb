class Array

  def my_zip(*arrs)
    arr = Array.new(self.length) {[]}
    (0..self.length-1).each do |idx|
      arr[idx] << self[idx]
      arrs.each do |x|
        arr[idx] << x[idx]
      end
    end
    arr

  end

end
