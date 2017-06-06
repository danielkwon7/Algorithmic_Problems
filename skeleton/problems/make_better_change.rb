# make better change problem from class
# make_better_change(24, [10,7,1]) should return [10,7,7]
# make change with the fewest number of coins

# To make_better_change, we only take one coin at a time and
# never rule out denominations that we've already used.
# This allows each coin to be available each time we get a new remainder.
# By iterating over the denominations and continuing to search
# for the best change, we assure that we test for 'non-greedy' uses
# of each denomination.

def make_better_change(value, coins)
  result = []
  relevant = coins.select{|x| value >= x}
  return nil if relevant.empty?
  relevant.each do |x| 
    remainder = value - x
    if remainder > 0
      prev = make_better_change(remainder, coins)
      result << [x] + prev unless prev.nil?
    else
      result << [x]
    end
  end
  result.sort{|x| x.size}.first
end
