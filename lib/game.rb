# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'player.rb'
# Game class
class Game
  include UI

  attr_accessor :continue
  def initialize(board, player1, player2)
    @new_board = board
    @player1 = player1
    @player2 = player2
    play
  end

  def play
    while @new_board.not_full?
      playing(@player1, @new_board)
      return if is_finished?(@new_board)

      playing(@player2, @new_board)
      return if is_finished?(@new_board)
    end
  end

  private

  def playing(player, board)
    cell = choose_num(board)
    player.make_move(board, cell.to_i)
    show_board(board)
    is_winner = has_won?(player)
    if is_winner
      if player == @player1
        self.continue = player1_msg
        return
      else
        self.continue = player2_msg
        return
      end
    else
      is_full = !board.not_full?
      if is_full
        self.continue = draw_msg
        return
      end
    end
  end

  def has_won?(player)
    @new_board.check_winner(player.sign)
  end

  def is_finished?(board)
    if !board.not_full? || has_won?(@player1) || has_won?(@player2)
      true
    else
      false
    end
  end
end
