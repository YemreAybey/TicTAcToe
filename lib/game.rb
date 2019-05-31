# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'ui.rb'

class Game
  attr_accessor :continue
  def initialize(board, player1, player2, ui)
    @new_board = board
    @player1 = player1
    @player2 = player2
    @ui = ui
    @ui.show_board(@new_board)
    play
  end

  def play
    
    @player2.sign = @player1.sign == 'X' ? 'O' : 'X'

    

    while @new_board.not_full?
      cell = @ui.choose_num(@new_board)
      @player1.make_move(@new_board, cell.to_i)
      @ui.show_board(@new_board)
      is_winner = check_game
      if is_winner == true
        self.continue = @ui.player1_msg
        return
      elsif is_winner == false && !@new_board.not_full?
        self.continue = @ui.draw_msg
        return
      end

      cell = @ui.choose_num(@new_board)
      @player2.make_move(@new_board, cell.to_i)
      @ui.show_board(@new_board)
      is_winner = check_game

      if is_winner == true
        self.continue = @ui.player2_msg
        return
      elsif is_winner == false && !@new_board.not_full?
        self.continue = @ui.draw_msg
        return
      end

    end
  end

  def check_game
    winner
  end

  private

  def winner
    @new_board.check_winner
  end
end
