class HashSet
  attr_reader :count
  
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end
  
  def insert(key)
    unless include?(key)
      @count += 1
      resize! if @count > num_buckets
      self[key] << key
    end
  end
  
  def include?(key)
    self[key].include?(key)
  end
  
  def remove(key)
    if include?(key)
      @count -= 1
      self[key].delete(key)
    end
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `num`
    @store[key.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end
  
  def resize!
    num_buckets.times { @store.push(Array.new) }
    current_stored = []
    @store.each { |bucket| current_stored.push(bucket.pop) until bucket.empty? }
    current_stored.each { |key| self[key] << key }
  end
end