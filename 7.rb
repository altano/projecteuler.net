# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
# that the 6th prime is 13.
#  
# What is the 10001st prime number?

require 'pp'
require 'prime_numbers'

print PrimeNumbers.nitems(10001).last # => 104743
