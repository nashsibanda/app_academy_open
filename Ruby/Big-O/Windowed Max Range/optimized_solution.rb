require "byebug"

class MyQueue
  def initialize
    @store = []
  end

  def peek
    @store[0]
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
  
  def enqueue(element)
    @store.push(element)
  end
  
  def dequeue
    @store.shift
  end
end

class MyStack
  def initialize
    @store = []
  end
  
  def peek
    @store[-1]
  end
  
  def size
    @store.size
  end
  
  def empty?
    @store.empty?
  end

  def pop
    @store.pop
  end

  def push(element)
    @store.push(element)
  end
  
end

class StackQueue
  def initialize
    @stack1, @stack2 = MyStack.new, MyStack.new
  end

  def size
    @stack1.size + @stack2.size
  end

  def empty?
    @stack1.empty? && @stack2.empty?
  end

  def enqueue(element)
    @stack1.push(element)
  end

  def dequeue
    stack_flipper if @stack2.empty?
    @stack2.pop
  end

  private

  def stack_flipper
    until @stack1.empty?
      @stack2.push(@stack1.pop)
    end
  end


end

class MinMaxStack
  def initialize
    @store = MyStack.new
  end
  
  def max
    @store.peek[:max] if !@store.empty?
  end
  
  def min
    @store.peek[:min] if !@store.empty?
  end
  
  def peek
    @store.peek[:value] if !@store.empty?
  end
  
  def size
    @store.size
  end
  
  def empty?
    @store.empty?
  end
  
  def pop
    @store.pop[:value] if !@store.empty?
  end
  
  def push(element)
    @store.push( {max: calc_max(element), min: calc_min(element), value: element } )
  end
  
  private
  
  def calc_max(element)
    return element if empty?
    [max, element].max
  end
  
  def calc_min(element)
    return element if empty?
    [min, element].min
  end
end

class MinMaxStackQueue
  def initialize
    @stack1, @stack2 = MinMaxStack.new, MinMaxStack.new
  end

  def size
    @stack1.size + @stack2.size
  end

  def empty?
    @stack1.empty? && @stack2.empty?
  end

  def enqueue(element)
    @stack1.push(element)
  end

  def dequeue
    stack_flipper if @stack2.empty?
    @stack2.pop
  end

  def max
    max_options = []
    max_options << @stack1.max unless @stack1.empty?
    max_options << @stack2.max unless @stack2.empty?
    max_options.max
  end

  def min
    min_options = []
    min_options << @stack1.min unless @stack1.empty?
    min_options << @stack2.min unless @stack2.empty?
    min_options.min
  end

  private

  def stack_flipper
    until @stack1.empty?
      @stack2.push(@stack1.pop)
    end
  end
end

def windowed_max_range(array, window_size)
  # debugger
  queue = MinMaxStackQueue.new
  current_max_range = 0
  array.each do |num|
    queue.enqueue(num)
    queue.dequeue if queue.size > window_size
    if queue.size == window_size
      range = queue.max - queue.min
      current_max_range = range if range > current_max_range
    end
  end
  return current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8