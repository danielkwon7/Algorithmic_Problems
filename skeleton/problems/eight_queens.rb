# CHALLENGE: Eight queens puzzle precursor
#
# Write a recursive method that generates all 8! possible unique ways to
# place eight queens on a chess board such that no two queens are in
# the same board row or column (the same diagonal is OK).
#
# Each of the 8! elements in the return array should be an array of positions:
# E.g. [[0,0], [1,1], [2,2], [3,3], [4,4], [5,5], [6,6], [7,7]]
#
# My solution used 3 method parameters: current_row, taken_columns, and
# positions so far
def eight_queens_possibilities(current_row, taken_columns, positions)
  positions ||= []
  return [positions] if current_row == 8
  result = []
  avail_columns = (0..7).to_a - taken_columns
  avail_columns.each do |col|
    dup = positions.dup
    dup << [current_row, col]
    result += eight_queens_possibilities(current_row+1, taken_columns + [col], dup)
  end
  result
end
