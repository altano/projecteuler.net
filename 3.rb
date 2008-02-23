require 'pp'
require 'prime_numbers'

def find_prime_factors(n)
  start = (Math.sqrt(n)).ceil
  x = start%2 == 0 ? start-1 : start
  while x > 0
    if n % x == 0 && PrimeNumber.prime?(x)
      puts "Bingo!: #{x}"
      exit
    end
    x -= 2
  end
end

find_prime_factors(317584931803) # => 3919