class Board
  @@board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
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

  def winner
    for i in @board
      if @board[i] 
      end 
    end
  end
end