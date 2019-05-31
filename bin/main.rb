#!/usr/bin/env ruby
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'
require_relative '../lib/module.rb'

include BoardLogic

ui = UI.new
board = Board.new
player1 = Player.new(ui)
player2 = Player.new

answer = Game.new(board, player1, player2, ui)

continue_until_no(answer)

