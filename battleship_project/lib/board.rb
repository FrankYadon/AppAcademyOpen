class Board
  def self.print_grid(grid)
    grid.map { |row| puts row.join(" ") }
  end

  attr_reader :size
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end
  
  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def num_ships
    count = 0
    @grid.flatten.each { |ele| count +=1 if ele == :S }
    count
  end

  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts "You sunk my battleship!"
      return true
    else
      self[pos] = :X
      return false
    end
  end

  def place_random_ships
    while self.num_ships < self.size / 4
      rand_row = rand(0...@grid.length)
      rand_col = rand(0...@grid.length)
      rand_pos = [rand_row, rand_col]
      self[rand_pos] = :S    
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |col|
        if col == :S
          :N
        else
          col
        end
      end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end

end
