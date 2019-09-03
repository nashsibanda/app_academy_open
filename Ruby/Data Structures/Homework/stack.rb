class Stack
  
  def initialize
    @stack = []
  end

  def push(element)
    @stack << element
  end

  def pop
    @stack.delete_at(-1)
  end

  def peek
    @stack[-1]
  end

end

temp_stack = Stack.new
temp_stack.push(1)
temp_stack.push(2)
p temp_stack.peek
temp_stack.pop
p temp_stack.peek
