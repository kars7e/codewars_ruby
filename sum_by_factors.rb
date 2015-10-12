# Sum by Factors 
# Problem URL: http://www.codewars.com/kata/sum-by-factors/ruby 
# Short desc: 
#   Given an array of positive or negative integers
#     I= [i1,..,in]
#   you have to produce a sorted array P of the form
#     [ [p, sum of all ij of I for which p is a prime factor (p positive) of ij] ...]
# Examples:
#   I = [12, 15], result = [[2, 12], [3, 27], [5, 15]]

require 'prime'
def sumOfDivided(lst)
  result = []
  Prime.each(lst.map(&:abs).max) do |p|
    valid = lst.select{ |i| i%p == 0 }
    result << [p, valid.inject(:+)] if valid.any?
  end
  result
end
