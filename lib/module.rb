# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
require_relative '../lib/module.rb'

include UI
# To continue the game
module BoardLogic
  def continue_until_no(answer)
    until answer.continue == 'N'
      value = choose_sign
      value2 = decide_other_sign(value)
      board = Board.new
      player1 = Player.new(value)
      player2 = Player.new(value2)
      answer = Game.new(board, player1, player2)
    end
  end
end
