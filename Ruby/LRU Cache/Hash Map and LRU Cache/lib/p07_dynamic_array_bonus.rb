require "byebug"

class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  attr_accessor :count
  include Enumerable

  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  def [](i)
    @store[i]
    rescue
      return nil
  end
  
  def []=(i, val)
    @store[i] = val
    rescue
      return nil
  end

  def capacity
    @store.length
  end

  def include?(val)
  end

  def push(val)
    index = @count
    @count += 1
    self[index] = val
  end

  def unshift(val)
    i = @count - 1
    until i < 0
      self[(i + 1)] = self[i]
      i -= 1
    end
    @count += 1
    self[0] = val
  end

  def pop
    return nil if @count <= 0
    value = last
    @store[@count - 1] = nil
    @count -= 1
    return value
  end
  
  def shift
    return nil if @count <= 0
    value = first
    i = 0
    until i == @count
      self[i] = self[i + 1]
      i += 1
    end
    @count -= 1
    value
  end

  def first
    @store[0]
  end

  def last
    @store[(@count - 1)]
  end

  def each(&prc)
    i = 0
    prc ||= Proc.new { |i| return i }
    while i < @count
      prc.call(self[i])
      i += 1
    end
    self
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    # ...
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
  end
end