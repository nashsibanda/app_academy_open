class Queue
  
  def initialize
    @queue = []
  end

  def enqueue(element)
    @queue << element
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue[0]
  end

end

temp_queue = Queue.new
temp_queue.enqueue(1)
temp_queue.enqueue(2)
temp_queue.enqueue(3)
temp_queue.enqueue(4)
p temp_queue.peek
temp_queue.dequeue
p temp_queue.peek
