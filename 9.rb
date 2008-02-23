sum = 1000

for a in (1..sum)
  for b in ((a+1)..sum)
    c = sum - a - b
    break if c <= b
    if a**2 + b**2 == c**2
      print [a, b, c].join('*')
      print " = #{a*b*c}"
      exit
    end
  end
end