# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#   
# Find the sum of all the primes below one million.
#   

require 'prime_numbers'

primes = PrimeNumbers.collect(999999) { |p| p }
puts sum = primes.inject { |sum,x| sum + x }
