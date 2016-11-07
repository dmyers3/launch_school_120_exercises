# numbers range from 1 to 100, inclusive
# max 7 guesses per game
# after each guess tell user if guess is too high or low
# validate input to be between 1, 100
# show user how many guesses remain

class Guesser
  attr_reader :lower_range, :upper_range
  
  def initialize(lower_range, upper_range )
    @lower_range = lower_range
    @upper_range = upper_range
  end
  
  def play
    initialize_game
    loop do
      display_guesses_left
      get_user_guess
      compare_user_guess
      update_guesses
      break if guesses_left == 0 || winner?
    end
    display_result
  end
  
  protected
  
  attr_accessor :guesses_left
  
  private
  
  attr_reader :user_guess, :winner, :winning_number
  
  
  def initialize_game
    @guesses_left = Math.log2(upper_range - lower_range).to_i + 1
    @winning_number = rand(lower_range..upper_range)
  end
  
  def display_guesses_left
    puts "You have #{guesses_left} guesses remaining."
  end
  
  def get_user_guess
    loop do
      print "Enter a number between #{lower_range} and #{upper_range}: "
      @user_guess = gets.chomp.to_i
      break if (lower_range..upper_range).include?(user_guess)
      print "Invalid guess. "
    end
  end
  
  def compare_user_guess
    if user_guess == winning_number
      @winner = true
    elsif user_guess > winning_number
      puts "Your guess is too high"
    else
      puts "Your guess is too low"
    end
    puts ""
  end
  
  def winner?
    winner == true
  end
  
  def update_guesses
    self.guesses_left -= 1
  end
  
  def display_result
    if winner?
      puts "You win!"
    else
      puts "You are out of guesses. You lose."
    end
  end
end

game = Guesser.new(501,1500)
game.play