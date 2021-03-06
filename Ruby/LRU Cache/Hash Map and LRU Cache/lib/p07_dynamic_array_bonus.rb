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
    return @store[@count + i] if i < 0
    @store[i]
    rescue
      return nil
  end
  
  def []=(i, val)
    if i < 0
      @store[@count + i] = val
    elsif i > @count
      push(nil) until i == @count
      push(val)
    else
      @store[i] = val
    end
    rescue
      return nil
  end

  def capacity
    @store.length
  end

  def include?(val)
    self.each { |el| return true if el == val }
    false
  end

  def push(val)
    index = @count
    @count += 1
    resize! if @count > capacity
    self[index] = val
  end

  def unshift(val)
    i = @count - 1
    until i < 0
      self[(i + 1)] = self[i]
      i -= 1
    end
    @count += 1
    resize! if @count > capacity
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
    i = 0
    until i == capacity
      return false unless self[i] == other[i]
      i += 1
    end
    true
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    new_array = StaticArray.new(capacity * 2)
    i = 0
    until i == capacity
      new_array[i] = self[i]
      i += 1
    end
    @store = new_array
  end
end