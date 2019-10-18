class Node
  attr_reader :key
  attr_accessor :val, :next, :prev
  
  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end
  
  def to_s
    "#{@key}: #{@val}"
  end
  
  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head, @tail = Node.new, Node.new
    @head.next = @tail
    @tail.prev = @head
  end
  
  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end
  
  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail && @tail.prev == @head
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.next = @tail
    new_node.prev = last
    @tail.prev.next = new_node
    @tail.prev = new_node
  end

  def update(key, val)
    selected_node = self.select { |node| node.key == key }.first
    selected_node.val = val if selected_node
  end

  def remove(key)
  end

  def each(&block)
    current_node = @head.next
    node_array = []
    until current_node.key == nil
      node_array << current_node
      current_node = current_node.next
    end
    node_array.each(&block)
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
