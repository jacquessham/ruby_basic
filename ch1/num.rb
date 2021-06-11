require 'rational'
require 'mathn'


num1 = Rational(2,3)
puts "#{num1} becomes #{num1.to_f}"
num2 = Math::sqrt(Rational(2,3))
puts "#{num2}"
num3 = Math::sqrt(25) # Return an integer, instead of float
puts "#{num3}"

num4 = Math.log(1)
puts "num4"
num5 = Math::E
puts "Take a natural log on #{num5} is #{Math.log(num5)}"
puts "Log base 10 of 100 is #{Math.log10(100)}"

matrix1 = Matrix[[4,5,6],[11,8,2],[25,9,4]]
matrix2 = Matrix[[1,2],[4,8],[12,20]]
puts "#{matrix1} multiply #{matrix2} is #{matrix1*matrix2}"

# Prime numbers, Prime.instance is a huge array
primes = Prime.instance
puts "Here is the prime numbers between 1 and 30:"
primes.each{|num| print "#{num} " if num < 30; break if num > 30}
puts
puts "Is 37 a prime number? #{Prime.prime?(37)}"
