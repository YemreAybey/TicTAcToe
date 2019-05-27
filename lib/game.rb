require_relative 'board.rb'

class Game  
  def initialize
    @new_board = Board.new
#    @player1 = Player.new
#    @player2 = Player.new
     @new_board.show_board     
     instructions     
  end  
  def instructions
    puts "Tictactoe game is 3X3 board game. You need to choose either X or O\n
    Every turn the players puts the sign X or O on their turn\n if 
    any player gets conswquetive X or O then he or she wins"
  end

  def play
    puts "Choose X or O"
    @player1.sign = gets.chomp
    
    while @player1.sign != "X" ||  @player1.sign  !="O"
      puts "please choose x or o"
      @player1.sign = gets.chomp      
    end

    if @player1.sign == "X"
      @player2.sign = "O"
    else
      @player2.sign = "X"
    end
  
    while @new_board.check_board
      puts "please choose any number from board to put #{@player1.sign}"  
      cell = gets.chomp
      @new_board.update(cell, @player1.sign)
      @new_board.show_board
      check_game
      puts "please choose any number from board to put #{@player2.sign}"  
      cell = gets.chomp
      @new_board.update(cell, @player2.sign)
      @new_board.show_board      
    end
  end
  def check_game
    if !@new_board.check_board
      
    end
  end
     @new_board.show_board
  end  
end

game_board = Game.new
p game_board
