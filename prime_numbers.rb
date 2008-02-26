require 'faster_generator'

class PrimeNumberGenerator
  def initialize
    @primes = [2]
    @g = FasterGenerator.new do |g|
      # replacing my naive algorithm with one from here:
      # https://rubyforge.org/snippet/detail.php?type=snippet&id=162
      x = 3
      while true
        max_p = Math.sqrt(x).truncate
        if !@primes.find { |y| y <= max_p ? x % y == 0 : break }
          g.yield @primes.last
          @primes << x
        end
        x += 2
      end      
    end
  end
  
  def next
    @g.next
  end
  
  def current
    @g.current
  end
  
  def primes
    @primes
  end
end

class PrimeNumbers
  class << self
    # Return the first n primes
    def nitems(n)
      raise ArgumentError unless n > 0
      
      pg = PrimeNumberGenerator.new

      while pg.primes.length != n
        x = pg.next
      end

      pg.primes
    end
    
    # Return all primes equal to or less than +max_value+
    def upto(max_value)
      raise ArgumentError unless max_value >= 2

      pg = PrimeNumberGenerator.new
      begin
        pg.next
      end while (pg.current <= max_value)

      pg.primes[0..-2]
    end
    
    # ------------------------------ private ------------------------------
    private
    def generator
      FasterGenerator.new do |g|
        # replacing my naive algorithm with one from here:
        # https://rubyforge.org/snippet/detail.php?type=snippet&id=162
        x = 3
        primes = [2]
        while true
          max_p = Math.sqrt(x).truncate
          if !primes.find { |y| y <= max_p ? x % y == 0 : break }
            g.yield primes.last
            primes << x
          end
          x += 2
        end      
      end
    end
  end
end

if $0 == __FILE__
  begin
    require 'spec'
  rescue LoadError
    require 'rubygems'
    require 'spec'
  end
  
  describe PrimeNumbers do
    it "should return prime numbers up to 10" do
      primes = PrimeNumbers.upto(10)
      primes.should == [2, 3, 5, 7]
    end
    
    it "should find largest prime number <= 100" do
      PrimeNumbers.upto(100).last.should == 97
    end
        
    it "should find that the 6th prime number is 13" do
      PrimeNumbers.nitems(6).last.should == 13
    end
    
    it "should find that the 1,000th prime number is 7919" do
      PrimeNumbers.nitems(1_000).last.should == 7919
    end
  end
end
