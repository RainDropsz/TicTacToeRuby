# frozen_string_literal: true

# Tic Tac Toe Player
class Player
  attr_reader :marker, :player_number

  def initialize(player_number)
    @player_number = player_number
    @marker = player_number.odd? ? 'x' : 'o'
  end
end
