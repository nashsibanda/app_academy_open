require_relative "room"

class Hotel
  
  def initialize(name, rooms_hash)
    @name = name
    @rooms = {}
    rooms_hash.each do |name, capacity|
      room = Room.new(capacity)
      @rooms[name] = room
    end
  end

  def name
    cap_name = []
    @name.split(" ").each { |name| cap_name << name.capitalize }
    cap_name.join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    if @rooms.keys.include?(room)
      true
    else
      false
    end
  end

  def check_in(person, room)
    if !self.room_exists?(room)
      p "sorry, room does not exist"
      return
    end

    if @rooms[room].add_occupant(person)
      p "check in successful"
    else
      p "sorry, room is full"
    end
  end

  def has_vacancy?
    @rooms.each do |room_name, room_value|
      if room_value.available_space > 0
        return true
      end
    end
    return false
  end

  def list_rooms
    @rooms.each do |room_name, room_value|
      puts room_name + ": " + room_value.available_space.to_s
    end
    return
  end

end
