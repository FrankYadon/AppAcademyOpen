require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player

  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    puts "Number of ships: #{@board.num_ships}"
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts "You lose!"
      return true
    else
      return false
    end
  end

  def win?
    if @board.num_ships == 0
      puts "You win!"
      return true
    else
      return false
    end
  end

  def game_over?
    self.win? || self.lose?
  end
  
  def turn
    pos = @player.get_move
    @remaining_misses -= 1 if !@board.attack(pos)
    @board.print
    puts "Remaining misses: #{@remaining_misses}"
  end
end
