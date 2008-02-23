def palindrome?(n)
  s = n.to_s
  # return false if s.length % 2 != 0
  center = s.length/2
  return s[0...center] == s[center...s.length].reverse
end

def largest_num_for(digits)
  ('9' * digits).to_i
end

def find_palindrome(digits)
  max = largest_num_for(digits)
  a = (0..max).to_a
  b = a.clone
  all_multiples = a.collect { |x| b.collect { |y| x * y } }.flatten.uniq.sort.reverse
  all_multiples.find { |x| palindrome?(x) }
end

puts find_palindrome(2)
puts find_palindrome(3)