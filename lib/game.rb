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
      is_finished=checking_winner(is_winner, UI::PLAYER1MSG)
      return if is_finished
      
      
      cell = choose_num(@new_board)
      @player2.make_move(@new_board, cell.to_i)
      show_board(@new_board)
      is_winner = winner
      is_finished = checking_winner(is_winner, UI::PLAYER2MSG)
      return if is_finished

    end
  end

  
  private

  def winner
    @new_board.check_winner
  end

  def checking_winner(winner, msg)
    is_there = false
    if winner == true
      if msg == UI::PLAYER1MSG
       self.continue = player1_msg 
       is_there = true          
      elsif msg == UI::PLAYER2MSG
        self.continue = player2_msg
        is_there = true 
      end
    elsif winner == false && !@new_board.not_full?
      self.continue = draw_msg
      is_there = true 
    end
    is_there
  end
end
