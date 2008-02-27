class RubiniusPrime
  include Enumerable
 
  def initialize
    @seed = 1
    @primes = []
    @counts = []
  end
  
  def succ
    i = -1
    size = @primes.size
    while i < size
      if i == -1
  @seed += 1
  i += 1
      else
  while @seed > @counts[i]
    @counts[i] += @primes[i]
  end
  if @seed != @counts[i]
    i += 1
  else
    i = -1
  end
      end
    end
    @primes.push @seed
    @counts.push @seed + @seed
    return @seed
  end
  alias next succ
 
  def each
    loop do
      yield succ
    end
  end
end
