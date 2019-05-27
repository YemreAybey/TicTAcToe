class Board
  @winner_points = [1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 4, 7, 2, 5, 8, 3, 6, 9, 1, 5, 9, 7, 5, 3]
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def show_board
    i = 0
    while i < @board.length
      puts " #{@board[i]} | #{@board[i+1]} | #{@board[i+2]}"
      puts "---+---+---"
      i = i+3
    end
  end

  def update_board(num, char)
    @board[num-1] = char
    self.show_board
  end

  def check_board
    @board.include? Integer
  end
  def check_winner
    while i < @winner_points.length
      if @winner_points[i] == @winner_points[i+1] && @winner_points[i] == @winner_points[i+2]
        return @winner_points[i]
      end
    end
  end
end