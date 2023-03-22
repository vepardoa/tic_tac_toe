# frozen_string_literal: true

# Top level documentation for class Game
class Game
  def initialize
    @board = Array.new(9, '-')
  end

  def print_board
    p "#{@board[0]}|#{@board[1]}|#{@board[2]}"
    p "#{@board[3]}|#{@board[4]}|#{@board[5]}"
    p "#{@board[6]}|#{@board[7]}|#{@board[8]}"
  end
end

game = Game.new
game.print_board
