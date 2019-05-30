#!/usr/bin/env ruby
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'


board = Board.new
player1 = Player.new
player2 = Player.new
ui = UI.new

answer = Game.new(board, player1, player2, ui)
until answer.continue == "N"
  board = Board.new
  player1 = Player.new
  player2 = Player.new
  ui = UI.new
  answer = Game.new(board, player1, player2, ui)
end

