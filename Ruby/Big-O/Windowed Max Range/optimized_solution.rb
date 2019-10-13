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

  def push
    @store.push
  end
  
end