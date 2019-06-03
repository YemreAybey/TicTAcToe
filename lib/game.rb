# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'player.rb'

include UI

class Game
  attr_accessor :continue
  def initialize(board, player1, player2)
    @new_board = board
    @player1 = player1
    @player2 = player2
    play
  end

  def play
    
    while @new_board.not_full?
    ending= sth(@player1, @new_board, UI::PLAYER1MSG)
    return if ending
      
      
    ending = sth(@player2, @new_board, UI::PLAYER2MSG)
    return if ending
    end
  end

  
  private

  def sth(player, board, msg)
    cell = choose_num(board)
    player.make_move(board, cell.to_i)
    show_board(board)
    is_winner = has_won?(player)
    if is_winner
     ans=checking_winner(msg)

    else
      is_full = !board.not_full?
      if is_full == true
        ans=checking_winner(UI::DRAWMSG)
      end
    end
    ans
  end

  def has_won?(player)
    @new_board.check_winner(player.sign)
  end

  def checking_winner(msg)
      if msg == UI::PLAYER1MSG
       self.continue = player1_msg
       return true

      elsif msg == UI::PLAYER2MSG
        self.continue = player2_msg
        return true
        elsif msg == UI::DRAWMSG
          self.continue = draw_msg
          return true
      end
      false
    end

  
end
