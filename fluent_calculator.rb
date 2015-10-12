# Fluent calculator 
# Problem URL: http://www.codewars.com/kata/fluent-calculator/ruby 
# Short desc: 
#    Implement a calculator that uses following syntax:
#      Calc.new.one.plus.two             # Should return 3
#      Calc.new.five.minus.six           # Should return -1
#      Calc.new.seven.times.two          # Should return 14
#      Calc.new.nine.divided_by.three     # Should return 3

class Calc
  def initialize()
    @chars = {zero: 0, one: 1, two: 2, three: 3, four: 4,
                five: 5, six: 6, seven: 7, eight: 8, nine: 9,
                plus: '+', minus: '-', times: '*', divided_by: '/'}
    @calc_str = ''
    
  end
  def method_missing(method_name, *args)
    @calc_str += @chars[method_name].to_s if @chars.keys.include?(method_name.to_sym)
    return self if @calc_str.length < 3
    return eval(@calc_str)
  end 
end
