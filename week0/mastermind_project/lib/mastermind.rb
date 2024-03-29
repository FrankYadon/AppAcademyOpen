require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(guess_code)
    puts "#{@secret_code.num_exact_matches(guess_code)} exact matches."
    puts "#{@secret_code.num_near_matches(guess_code)} near matches."
  end

  def ask_user_for_guess
    print "Enter a code: "
    guess = Code.from_string(gets.chomp)
    self.print_matches(guess)
    @secret_code == guess
  end
end
