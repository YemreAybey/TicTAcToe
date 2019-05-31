# frozen_string_literal: true

require_relative 'board.rb'

include UI

class Player
  attr_accessor :sign
  def initialize(sign)
    @sign = sign
  end

  def assign_sign(sign)
    self.sign = sign.choose_sign
  end

  def make_move(board, cell)
    board.update_board(cell, sign)
  end
end
