class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = @secret_word.split("").map { "_" }
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end
  
  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.split("").each_with_index do |ele, i|
      indices << i if ele == char
    end
    indices
  end

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "That has already been attempted."
      return false
    else
      indices = get_matching_indices(char)
      @remaining_incorrect_guesses -= 1 if indices.empty?
      fill_indices(char, indices)
      @attempted_chars << char
      return true
    end 
  end
  
  def ask_user_for_guess
    print "Enter a char: "
    guess = gets.chomp
    try_guess(guess)
  end
  
  def win?
    if @secret_word == @guess_word.join("")
      puts "You WIN!!"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "You LOSE!!"
      return true
    else
      return false
    end
  end
  
  def game_over?
    if lose? || win?
      puts "The word was #{@secret_word}."
      return true
    else
      return false
    end
  end

end
