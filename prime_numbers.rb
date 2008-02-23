class PrimeNumber
  def self.prime?(n)
    (2...(n/2)).each do |x|
      return false if n % x == 0
      x += 2
    end
    true
  end
end