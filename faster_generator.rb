# Fast version of Generator library found in stdlib. 
# Courtesy of Jacob Fugal @ http://rubyquiz.com/quiz66.html
# Generator was really slow (so slow, it was actually documented 
# as being slow.  We all know what that means in ruby)
require 'thread'

class FasterGenerator
  def initialize( enum=nil, &block )
    @position = 0
    @values = []
    @done = false
    @mutex = Mutex.new
    @block = block

    if enum
      @block = proc{ |g|
        enum.each{ |x| g.yield x }
      }
    end
  end

  def pos
    @position
  end

  def yield( x )
    @mutex.synchronize{ @values << x }
    Thread.stop
  end

  def current
    collect_value
    raise EOFError if eof?
    @values[@position]
  end

  def next?
    return (not end?)
  end

  def end?
    collect_value
    return eof?
  end

  def next
    x = current
    @position += 1
    x
  end

  def rewind
    @position = 0
    self
  end

  def each
    self.rewind
    while self.next?
      yield self.next
    end
  end

  def index
    pos
  end

  private
  def collect_value
    @thread ||= Thread.new {
      Thread.stop
      @block[self]
      @mutex.synchronize{ @done = true }
    }
    Thread.pass until @thread.stop?
    @thread.run if @thread.status and need_value?
    Thread.pass while need_value?
  end

  def need_value?
    @mutex.synchronize{ not @position < @values.size and not @done }
  end

  def eof?
    @mutex.synchronize{ not @position < @values.size and @done }
  end
end
