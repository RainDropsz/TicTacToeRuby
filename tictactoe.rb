=begin
Build a tic-tac-toe game on the command line where 
two human players can play against each other and 
the board is displayed in between turns.
=end

class Game
  def initialize()
    player1 = Players.new()
    player2 = Players.new()
    @players = [player1, player2]
    @board = [0, "_", "_", "_", "_", "_", "_", " ", " ", " "]
    @turn = 0

    puts "Let's Play 2-Player Tic Tac Toe!"
    print_board

    while board_is_not_full do
      active_player = @players[@turn]
      move = active_player.get_move

      if spot_is_empty(move)
        @board [move] = active_player.marker
        print_board

        if winner?(move, active_player.marker)
          active_player.print_winner
          return
        end
      else
        puts "Sorry, spot is taken"
      end

      next_turn
    end

    puts "It's a tie!"

  end

  def winner?(position, marker)
    winners = [ "123", "456", "789", "147", "258", "369", "159", "357"]
    relevant_winners =  winners.select { |combo| combo.include?(position.to_s)}

    relevant_winners.each do |string|
      result = true

      result = result && 
        @board[ string[0].to_i ] == marker &&
        @board[ string[1].to_i ] == marker &&
        @board[ string[2].to_i ] == marker 
      
      if result 
        return true
      end
    end

    false
  end

  def next_turn
    @turn = (@turn + 1) % 2
  end

  def board_is_not_full
    @board.include?("_") || @board.include?(" ")
  end

  def spot_is_empty(position)
    @board[position] == "_" || @board[position] == " "
  end

  def print_board()
    puts "   #{@board[1]}|#{@board[2]}|#{@board[3]}     1|2|3"
    puts "   #{@board[4]}|#{@board[5]}|#{@board[6]}     4|5|6"
    puts "   #{@board[7]}|#{@board[8]}|#{@board[9]}     7|8|9"
  end
end


class Players
  attr_reader :marker
  @@count = 0

  def initialize()
    @@count += 1
    @player_number = @@count
    @@count.odd? ? @marker = "x" : @marker = "o"
  end

  def print_winner
    puts "Congratulations! Player #{@player_number} wins!"
  end

  def get_move()
    puts "Player #{@player_number}'s turn, place your #{@marker}"
    move = gets.chomp.to_i
  end

end

game = Game.new()
