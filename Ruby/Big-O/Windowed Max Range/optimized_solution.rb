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
    @active_stack.empty?
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
    until @stack2.empty?
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
  
  def calc_max(element)
    return element if empty?
    [min, element].min
  end
end