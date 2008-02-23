evens = []
a, b = 1, 2
while true
  break if (a+b) > 1000000
  evens.push(a+b) if (a+b)%2 == 0
  a, b = b, a+b
end

puts evens.inject(0) { |sum, n| sum += n } + 2
