class LRUCache
  def initialize(size)
    @store = []
    @cache_size = size
    @next_count = 0
  end

  def count
    @store.count
  end

  def add(el)
    if count < @cache_size
      @store << [@next_count, el]
      @next_count += 1
    elsif @store.any? { |item| item[1] == el }
      existing_index = @store.index { |item| item[1] == el }
      @store[existing_index] = [@next_count, el]
      @next_count += 1
    else
      @store.sort! { |a, b| a[0] <=> b[0] }
      @store[0] = [@next_count, el]
      @next_count += 1
    end
  end

  def show
    p @store.sort { |a, b| a[0] <=> b[0] }.map { |item| item[1] }
  end

  private
  # helper methods go here!

end

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]