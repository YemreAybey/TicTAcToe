require_relative 'board.rb'

class Game  
  def initialize
    @new_board = Board.new
#    @player1 = Player.new
#    @player2 = Player.new
     @new_board.show_board
  end  
end

game_board = Game.new
p game_board
