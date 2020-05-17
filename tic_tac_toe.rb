# frozen_string_literal: true

# Build a tic-tac-toe game on the command line where
# two human players can play against each other and
# the board is displayed in between turns.

# Tic Tac Toe Game
class TicTacToe
  require_relative 'board.rb'
  require_relative 'player.rb'

  def initialize
    @board = Board.new
    @players = [Player.new(1), Player.new(2)]

    print_welcome
    play_game
  end

  private

  def change_players
    @players[0], @players[1] = @players[1], @players[0]
  end

  def gets_move(player)
    puts "Player #{player.player_number}'s turn, place your #{player.marker}"
    gets.chomp.to_i
  end

  def play_game
    until @board.full?
      @board.place_move(player, gets_move(player))
      winner = winner?(player.marker)
      break if winner

      change_players
    end

    print_win_or_tie(winner, player)
    TicTacToe.new
  end

  def player
    @players[0]
  end

  def print_welcome
    puts "Let's Play 2-Player Tic Tac Toe!"
    @board.print_board
  end

  def print_win_or_tie(winner, active_player)
    if winner
      puts "\nCongratulations! Player #{active_player.player_number} wins!"
    else
      puts "\nIt's a tie!\n"
    end

    puts '-------------------------------'
  end

  def winner?(marker)
    winners = %w[123 456 789 147 258 369 159 357]

    winners.each do |string|
      return true if
        @board.at(string[0].to_i) == marker &&
        @board.at(string[1].to_i) == marker &&
        @board.at(string[2].to_i) == marker
    end

    false
  end
end

TicTacToe.new
