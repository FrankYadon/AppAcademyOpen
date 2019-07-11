class GuessingGame
  def initialize(min, max)
    @secret_num = rand(min..max)
    @num_attempts = 0
    @game_over = false
  end

  def num_attempts
    @num_attempts
  end

  def game_over?
    @game_over
  end

  def check_num(num)
    @num_attempts += 1
    if num > @secret_num
      puts 'Too big!'
    elsif num < @secret_num
      puts 'Too small!'
    else
      puts 'You win!!'
      @game_over = true
    end
  end

  def ask_user
    print 'Enter a number: '
    guess = gets.chomp.to_i
    self.check_num(guess)
  end
end
