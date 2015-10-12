# The Millionth Fibonacci Kata 
# Problem URL: http://www.codewars.com/kata/the-millionth-fibonacci-kata/ruby
# Short desc: Find a Fibonacci number for large input (above 1,000,000)

def fib(n)
  n, sign = n < 0 ? [-n, 2*(n % 2) - 1] : [n, 1]
  a , b, p, q = 1, 0, 0, 1
  while n != 0 do
    a, b  = (b+a)*q + a*p, b*p + a*q if n.odd?
    p, q = p**2 + q**2, 2*p*q  + q**2
    n /= 2
  end
  sign * b
end 
