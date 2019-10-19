require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :store
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      update_node!(@map[key])
      return @map.get(key).val
    else
      calc!(key)
      eject!
      return @map.get(key).val
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    value = @prc.call(key.to_i)
    @store.append(key, value)
    @map.set(key, @store.last)
  end

  def update_node!(node)
    n_key, n_val = node.key, node.val
    @store.remove(n_key)
    @store.append(n_key, n_val)
    @map.set(n_key, @store.last)
  end

  def eject!
    if count > @max
      oldest_node = @store.first
      @map.delete(oldest_node.key)
      oldest_node.remove
    end
  end
end