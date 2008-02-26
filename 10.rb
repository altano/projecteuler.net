# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#   
# Find the sum of all the primes below two million.
#   

require 'prime_numbers'

primes = PrimeNumbers.upto(1_999_999)
print sum = primes.inject { |sum,x| sum + x } # => 142913828922