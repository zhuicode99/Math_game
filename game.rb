require "./player"
require "./question"

class Game
     
  def start_game
    puts "---------- TwO-O-Player ----------"
    puts "\n"
    puts "Player 1: Please enter your name"
    @player1 = Player.new(gets.chomp)
      
    puts "Player 2: Please enter your name"
    @player2 = Player.new(gets.chomp)
      
    puts "Game Started!"
    puts "\n"
    @current_player = @player1
      
    game_play while (@player1.lives > 0 && @player2.lives > 0)
    game_over
  end

  def turn_update
    if @current_player == @player1
       @current_player = @player2
    else
       @current_player = @player1
    end
  end

  def game_play
    question = Question.new
    puts "\n"
    puts "---------- NEW TURN ----------"
    puts "\n"
    puts "#{@current_player.name}: What does #{question.num1} plus #{question.num2} equal?"
    answer = gets.chomp.to_i

    if answer == question.sum
      puts "\n"
      puts "#{@current_player.name}: YES! You are correct!"
      "\n"
    else
      puts "\n"
      puts "#{@current_player.name}: Seriously? You are wrong!"
      @current_player.lives -= 1
    end
    puts "\n"
    puts "SCORE: #{@player1.name}: #{@player1.lives}/3 -VS- #{@player2.name}: #{@player2.lives}/3"
    turn_update
  end

  def game_over
    puts "#{@current_player.name} wins with a score of #{@current_player.lives}/3"
    puts "---------- GAME OVER ----------"
    puts "Good bye!"
  end

end