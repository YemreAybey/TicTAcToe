# frozen_string_literal: true

require_relative 'ui.rb'
require_relative 'board.rb'

class Player
  attr_accessor :sign

  def initialize(sign = nil)    
    @sign = sign.choose_sign if sign != nil
  end

  def assign_sign(sign)
    self.sign = sign.choose_sign
  end

  def make_move(board, cell)
    board.update_board(cell, sign)
  end
end
