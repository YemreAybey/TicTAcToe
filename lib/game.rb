# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'player.rb'

class Game
def initialize
  @new_board = Board.new
  @player1 = Player.new
  @player2 = Player.new
  @new_board.show_board
  instructions
  play
end

def instructions
  puts "Tictactoe game is 3X3 board game. You need to choose either X or O"
  puts "******************************************************************"
  puts "---Every turn the players puts the sign X or O on their turn if---"
  puts "******************************************************************"
  puts "----Any player gets 3 consequetive X or O then he or she wins-----"
end

def play
  puts "\n"
  puts 'Choose X or O'
  @player1.sign = gets.chomp

  while @player1.sign != 'X' && @player1.sign != 'O'
    puts 'please choose X or O'
    @player1.sign = gets.chomp
  end

  @player2.sign = @player1.sign == 'X' ? 'O' : 'X'

  while @new_board.check_board
    puts "please choose any number from board to put #{@player1.sign}"
    cell = gets.chomp

    until @new_board.check_sign(cell)
      if (1..9).include?(cell.to_i)
        puts 'This number is not available. Please choose another number!'
      else
        puts 'This is not available please choose from the board!'
      end
      cell = gets.chomp
    end
    @new_board.update_board(cell.to_i, @player1.sign)
    @new_board.show_board
    is_winner = check_game

    if is_winner == true
      puts "Player1 won\nWould you like to play again? Type Y/N"
      input = gets.chomp
      until input == 'Y' || input == 'N'
        puts 'Please enter Y or N'
        input = gets.chomp
      end
      if input == 'N'
        puts 'Thanks for playing'
        exit
      else
        Game.new
      end

    elsif is_winner == false && !@new_board.check_board
      puts 'It is a draw\nWould you like to play again? Type Y/N'
      input = gets.chomp
      until input == 'Y' || input == 'N'
        puts 'Please enter Y or N'
        input = gets.chomp
      end
      if input == 'Y'
        @new_board = Board.new
        play
      else
        puts 'Thank you for playing game'
        exit
      end
    end

    puts "please choose any number from board to put #{@player2.sign}"
    cell = gets.chomp
    until @new_board.check_sign(cell)
      case (1..9).include?(cell.to_i)
      when true then puts 'This number is not available. Please choose another number'
      when false then puts 'This is a string please put number'
      end
      cell = gets.chomp
    end

    @new_board.update_board(cell.to_i, @player2.sign)
    @new_board.show_board
    is_winner = check_game

    if is_winner == true
      puts 'Player2 won'
      puts 'Would you like to play again? Type Y/N'
      input = gets.chomp
      until input == 'Y' || input == 'N'
        puts 'Please enter Y or N'
        input = gets.chomp
      end
      exit('Thank you for playing') if input == 'N'
      return Game.new

    elsif is_winner == false && !@new_board.check_board
      puts 'It is a draw'
      puts 'Would you like to play again? Type Y/N'
      input = gets.chomp
      until input == 'Y' || input == 'N'
        puts 'Please enter Y or N'
        input = gets.chomp
      end
      if input == 'Y'
        @new_board = Board.new
        play
      else
        puts 'Thank you for playing game'
        return
      end
    end

  end
end

def check_game
  winner
end

def winner
  @new_board.check_winner
end
end
