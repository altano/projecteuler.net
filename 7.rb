require 'pp'
require 'progressbar'
require 'prime_numbers'

def generate_X_primes(n)
  raise ArgumentError unless n >= 2
  
  bar = ProgressBar.new("Progress", n)
  primes = [2]
  x = 3
  while true
    if PrimeNumber.prime?(x)
      primes.push(x)
      bar.inc(1)
      break if primes.length == n
    end
    x += 2
  end
  
  primes
end

# pp generate_X_primes(4)
# pp generate_X_primes(40)
# raise if generate_X_primes(6).last != 13

pp generate_X_primes(10001) # => 104743