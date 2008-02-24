# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 317584931803?

require 'pp'
require 'prime_numbers'

def find_largest_prime_factor(n)
  largest_factor = (Math.sqrt(n)).ceil
  PrimeNumbers.find_reverse(largest_factor) { |p| n % p == 0 }
end

puts "Bingo!: #{find_largest_prime_factor(317584931803)}" # => 3919