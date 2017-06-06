def transpose(array)
  x = array.length
  standard = Array.new(x) {Array.new(x)}
  array.length.times do |row|
    array.length.times do |col|
      standard[row][col] = array[col][row]
    end
  end
  standard
end
