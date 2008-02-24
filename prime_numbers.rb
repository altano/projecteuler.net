# The PrimeNumbers class is essentially the set of all prime numbers, with an
# Array-like interface for interacting with that set.

require 'progressbar' if $show_progress_bar

class PrimeNumbers
  class << self
    def prime?(n)
      raise ArgumentError.new("n must be positive") unless n > 0
      return false if n < 2 # 1 isn't prime
      (2..(n/2)).each do |x|
        return false if n % x == 0
        x += 2
      end
      true
    end

    def collect(max, start = 1)
      bar = ProgressBar.new("Generating primes", max) if $show_progress_bar
      
      a = []
      x = start
      
      while x <= max
        bar.inc(2) if $show_progress_bar
        a << yield(x) if prime?(x)
        x += 2
      end
      
      return a
    end
    
    def upto(max)
      collect(max) { |p| p }
    end
    
    # Find the first n primes
    def first(n)
      raise ArgumentError unless n >= 2
    
      bar = ProgressBar.new("Generating primes", n) if $show_progress_bar
      primes = [2]
      x = 3
      while true
        if prime?(x)
          primes.push(x)
          bar.inc(1) if $show_progress_bar
          break if primes.length == n
        end
        x += 2
      end
    
      primes
    end

    # The 'reverse' family of methods start at a given number and and
    # decrements from there, lazily generating primes and checking the block
    def find_reverse(start)
      raise ArgumentError.new("start must be greater than 0") unless start > 0
      x = start%2 == 0 ? start-1 : start
      bar = ProgressBar.new("Generating primes", x) if $show_progress_bar
      while x > 0
        # we'll go on the assumption that checking prime-ness is harder than
        # evaluating the block
        return x if yield(x) && PrimeNumbers.prime?(x)
        x -= 2
        bar.inc(2) if $show_progress_bar
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
    it "should identify 7 as prime" do
      PrimeNumbers.prime?(7).should == true
    end

    it "should not identify 4 as prime" do
      PrimeNumbers.prime?(4).should == false
    end
    
    it "should collect prime numbers up to 10" do
      primes = PrimeNumbers.collect(10) { |p| p }
      primes.should == [3, 5, 7]
    end
    
    it "should collect the squares of prime numbers up to 10" do
      primes = PrimeNumbers.collect(10) { |p| p**2 }
      primes.should == [9, 25, 49]
    end
    
    it "should find largest prime number <= 10" do
      PrimeNumbers.find_reverse(10) { |p| true }.should == 7
    end

    it "should find largest prime number <= 1000" do
      PrimeNumbers.find_reverse(1000) { |p| true }.should == 997
    end
    
    it "should find that the 6th prime number is 13" do
      PrimeNumbers.first(6).last.should == 13
    end 
  end
end