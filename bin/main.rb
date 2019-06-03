#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
require_relative '../lib/module.rb'
require_relative '../lib/ui.rb'

instructions

board = Board.new
show_board(board)
sign1 = choose_sign
sign2 = decide_other_sign(sign1)

player1 = Player.new(sign1)
player2 = Player.new(sign2)

answer = Game.new(board, player1, player2)

continue_until_no(answer)
