# frozen_string_literal: true

class Board
  @@winner_points = [0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 3, 6, 1, 4, 7, 2, 5, 8, 0, 4, 8, 6, 4, 2]
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def show_board
    i = 0
    while i < @board.length
      puts " #{@board[i]} | #{@board[i + 1]} | #{@board[i + 2]}"
      puts '---+---+---'
      i += 3
    end
  end

  def update_board(num, char)
    @board[num - 1] = char
  end

  def check_board
    @board.any? Integer
  end

  def check_sign(num)
    @board[num.to_i - 1] == num.to_i
  end

  def check_winner
    i = 0
    while i < @@winner_points.length
      if @board[@@winner_points[i]] == @board[@@winner_points[i + 1]] && @board[@@winner_points[i]] == @board[@@winner_points[i + 2]]
        return true
      end

      i += 3
    end
    false
  end
end