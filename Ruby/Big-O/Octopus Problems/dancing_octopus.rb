TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = {
  "up" => 0, 
  "right-up" => 1, 
  "right" => 2, 
  "right-down" => 3,
  "down" => 4, 
  "left-down" => 5, 
  "left" => 6, 
   "left-up" => 7
}

# def make_hash
#   tiles_array.each_with_index { |tile, idx| tiles_hash[tile] = idx }
# end

def slow_dance(direction, tiles)
  tiles.each_with_index { |tile, idx| return idx if direction == tile }
end

def fast_dance(direction, tiles)
  return tiles[direction]
end

p slow_dance("up", TILES_ARRAY)
#> 0

p slow_dance("right-down", TILES_ARRAY)
#> 3
puts
# make_hash
p fast_dance("up", tiles_hash)
#> 0

p fast_dance("right-down", tiles_hash)
#> 3