require_relative "room"

class Hotel
  def initialize(name, room_hash)
    @name = name
    @rooms = {}
    room_hash.each { |k, v| @rooms[k] = Room.new(v) }
  end
  
  def name
    @name.split.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    @rooms.keys.include?(room)
  end

  def check_in(person, room)
    if self.room_exists?(room)
      if @rooms[room].add_occupant(person)
        puts "check in successful"
      else
        puts "sorry, room is full"
      end
    else
      puts "sorry, room does not exist"
    end
  end

  def has_vacancy?
    @rooms.each do |room, v|
      return true if @rooms[room].full? == false
    end
    false
  end

  def list_rooms
    @rooms.each do |room, v|
      puts "#{room} #{v.available_space}"
    end
  end
end
