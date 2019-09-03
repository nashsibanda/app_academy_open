class Map
  
  def initialize
    @map = []
  end

  def set(key, value)
    if @map.any? { |pair| pair[0] == key }
      index = @map.index { |pair| pair[0] == key }
      @map[index] = [key, value]
      return
    end
    @map << [key, value]
  end

  def get(key)
    return @map.select { |pair| pair[0] == key }.map{:shift}
  end

  def delete(key)
    @map.delete_if { |pair| pair[0] == key }
  end

  def show
    @map
  end

end

temp_map = Map.new
temp_map.set("A", 1)
temp_map.set("B", 10)
temp_map.set("C", 3)
temp_map.set("D", 4)
temp_map.set("E", 6)
temp_map.set("F", 3)
p temp_map.show
temp_map.set("E", 4)
temp_map.set("B", 29)
p temp_map.show
temp_map.delete("B")
p temp_map.show
temp_map.set("E", 14)
temp_map.set("B", 19)
p temp_map.show