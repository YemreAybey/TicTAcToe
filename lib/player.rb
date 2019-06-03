# frozen_string_literal: true

require_relative 'board.rb'

# class Player
class Player
  include UI

  attr_accessor :sign
  def initialize(sign)
    @sign = sign
  end

  def make_move(board, cell)
    board.update_board(cell, sign)
  end
end
