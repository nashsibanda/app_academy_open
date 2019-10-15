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
    @store[0]
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