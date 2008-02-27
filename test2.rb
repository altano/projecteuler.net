require 'benchmark'
require 'mathn'
require 'prime_numbers'
require 'libtom/math'
require 'rubinius_prime'

n = 10_000

mathn_prime = Prime.new
tom_prime   = LibTom::Math::Prime.new
rubinius_prime = RubiniusPrime.new
custom_prime = PrimeNumberGenerator.new

mathn_arr = tom_arr = rubinius_arr = custom_arr = Array.new(4, [])

Benchmark.bm(25) do |x|
  x.report("Mathn    #{n} primes") { n.times { mathn_arr << mathn_prime.succ       } }
  x.report("Custom   #{n} primes") { n.times { custom_arr << custom_prime.next     } }
  x.report("LibTom   #{n} primes") { n.times { tom_arr << tom_prime.succ           } }
  x.report("Rubinius #{n} primes") { n.times { rubinius_arr << rubinius_prime.succ } }
end

unless (mathn_arr == tom_arr && tom_arr == rubinius_arr && rubinius_arr == custom_arr)
  raise Exception.new("Some of the results don't match up...")
end
