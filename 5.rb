class LCM
  def initialize(nums)
    @nums = nums
    
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
    # calculate the lcm
    x = @nums.first
    lowest = @nums.first
    while true
      @nums.each do |y|
        if (x%y != 0)
          if y < lowest
            lowest = y
            print_progress(x, y)
          end
          break
        elsif y == @nums.last
          return x
        end
      end
      x += @nums.first
    end
  end
  
  def print_progress(x, y)
    print "["
    print "#"*@nums.index(y)
    print "_"*(@nums.length-(@nums.index(y)))
    print "] "
  
    puts "#{x} % #{y} != 0"
  end
end

def o(n)
  a = (1..n).to_a.reverse
  puts "#{n} = #{LCM.new(a).calc}"
  puts "----------------------------"
end

o(10)
o(15)
o(20)
