require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if include?(key)
      bucket(key).update(key, val)
    else
      @count += 1
      resize! if @count > num_buckets
      bucket(key).append(key, val)
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    if include?(key)
      @count -= 1
      bucket(key).remove(key) 
    end
  end

  def each(&block)
    node_array = []
    @store.each do |list|
      list.each do |node|
        node_array << node
      end
    end
    node_array.map! { |node| [node.key, node.val] }
    node_array.each(&block)
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    num_buckets.times { @store.push(LinkedList.new) }
    current_stored = []
    self.each do |node|
      key, val = node[0], node[1]
      delete(key)
      set(key, val)
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets]
  end
end
