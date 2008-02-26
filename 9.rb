# A Pythagorean triplet is a set of three natural numbers, a<b<c, for which,
#
#       a² + b² = c²
#
# For example, 3² + 4² = 9 + 16 = 25 = 5².
# 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def find_pythagorean_triplet(sum)
  for a in (1..sum)
    for b in ((a+1)..sum)
      c = sum - a - b
      break if c <= b
      if a**2 + b**2 == c**2
        return a*b*c
      end
    end
  end
end

print find_pythagorean_triplet(1000)