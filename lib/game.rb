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
  end

  def play
    until game_is_over
      @player1.make_move(@new_board) unless has_won?(@player2) || !@new_board.not_full?
      @player2.make_move(@new_board) unless has_won?(@player1) || !@new_board.not_full?
      display_message if game_is_over
    end
  end

  private

  def display_message
    if has_won? @player1
      self.continue = player1_msg
    elsif has_won? @player2
      self.continue = player2_msg
    elsif !@new_board.not_full?
      self.continue = draw_msg
    end
  end

  def has_won?(player)
    @new_board.check_winner(player.sign)
  end

  def game_is_over
    if !@new_board.not_full? || has_won?(@player1) || has_won?(@player2)
      true
    else
      false
    end
  end
end
