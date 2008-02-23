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

puts diff(100)