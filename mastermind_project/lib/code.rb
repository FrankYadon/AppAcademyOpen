class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(array)
    array.each do |ele|
      return false if !POSSIBLE_PEGS.has_key?(ele.upcase)
    end
    true
  end

  def self.random(length)
    randoms = []
    length.times {randoms << POSSIBLE_PEGS.keys.sample}
    Code.new(randoms)
  end

  def self.from_string(peg_string)
    Code.new(peg_string.split(""))
  end

  attr_reader :pegs

  def initialize(peg_array)
    if Code.valid_pegs?(peg_array)
      @pegs = peg_array.map(&:upcase)
    else
      raise "Invalid Pegs"
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    exacts = 0
    (0...self.length).each { |i| exacts +=1 if self[i] == guess[i] }
    exacts
  end

  def num_near_matches(guess)
    nears = 0
    (0...guess.length).each do |i|
      if guess[i] != self[i] && self.pegs.include?(guess[i])
        nears +=1
      end
    end
    nears
  end

  def ==(guess)
    guess.pegs == self.pegs
  end

end
