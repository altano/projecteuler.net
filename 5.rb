# 2520 is the smallest number that can be divided by each of the numbers from
# 1 to 10 without any remainder.
#  
# What is the smallest number that is evenly divisible by all of the numbers
# from 1 to 20?

class LCM
  def initialize(nums)
    @nums = nums.to_a.sort.reverse
    
    # eliminate those that are redundant (by virtue of being a factor of a larger #)
    @nums.each do |i|
      @nums.each do |j|
        if i!=j && i%j == 0
          @nums.delete_if {|z| z == j}
        end
      end
    end
  end
  
  def calc  
    # calculate the LCM
    x = @nums.first
    while true
      @nums.each do |y|
        if (x%y != 0)
          break
        elsif y == @nums.last
          return x
        end
        x += @nums.first
      end
    end
  end  
end

def find_lcm_of_one_to(n)
  print LCM.new((1..n)).calc
end

find_lcm_of_one_to(20) # => 232792560
