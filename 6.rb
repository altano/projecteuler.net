# The sum of the squares of the first ten natural numbers is,
#  
#       1² + 2² + ... + 10² = 385
#  
# The square of the sum of the first ten natural numbers is,
#  
#       (1 + 2 + ... + 10)² = 55² = 3025
#  
# Hence the difference between the sum of the squares of the first ten natural
# numbers and the square of the sum is 3025 − 385 = 2640.
#  
# Find the difference between the sum of the squares of the first one hundred
# natural numbers and the square of the sum.


def sum_of_square(n)
  (1..n).inject(0) { |sum, n| sum += n**2 }
end

def square_of_sum(n)
  (1..n).inject(0) { |sum, n| sum += n } ** 2
end

raise if square_of_sum(10) != 3025
raise if sum_of_square(10) != 385

def diff(n)
  (sum_of_square(n) - square_of_sum(n)).abs
end

raise if diff(10) != 2640

print diff(100)