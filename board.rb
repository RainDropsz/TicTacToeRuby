# frozen_string_literal: true

# Tic Tac Toe Board
class Board
  def initialize
    @board = [0, '_', '_', '_', '_', '_', '_', ' ', ' ', ' ']
  end

  def at(spot)
    @board[spot]
  end

  def full?
    !(@board.include?('_') || @board.include?(' '))
  end

  def place_move(player, move)
    if spot_is_empty?(move)
      @board[move] = player.marker
      print_board
    else
      puts 'Sorry, spot is not available.'
    end
  end

  def print_board
    puts "   #{@board[1]}|#{@board[2]}|#{@board[3]}     1|2|3"
    puts "   #{@board[4]}|#{@board[5]}|#{@board[6]}     4|5|6"
    puts "   #{@board[7]}|#{@board[8]}|#{@board[9]}     7|8|9"
  end

  def spot_is_empty?(position)
    @board[position] == '_' || @board[position] == ' '
  end
end
