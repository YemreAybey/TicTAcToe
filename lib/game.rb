# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'player.rb'

include UI

class Game
  attr_accessor :continue
  def initialize(board, player1, player2)
    @new_board = board
    @player1 = player1
    @player2 = player2
    play
  end

  def play
    
    while @new_board.not_full?
      cell = choose_num(@new_board)
      @player1.make_move(@new_board, cell.to_i)
      show_board(@new_board)
      is_winner = winner
      
      checking_winner(is_winner, player1_msg)
      
      cell = choose_num(@new_board)
      @player2.make_move(@new_board, cell.to_i)
      show_board(@new_board)
      is_winner = winner
      checking_winner(is_winner, player2_msg)
    end
  end

  
  private

  def winner
    @new_board.check_winner
  end

  def checking_winner(winner, msg)
    if winner == true
        self.continue = msg            
      return
    elsif winner == false && !@new_board.not_full?
      self.continue = draw_msg
      return
    end
    
  end
end
