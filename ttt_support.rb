# frozen_string_literal: true

board = Array.new(9, ' ')

# print the game board
def print_board(board)
  puts "#{board[0]} | #{board[1]} | #{board[2]}"
  puts "-----------"
  puts "#{board[3]} | #{board[4]} | #{board[5]}"
  puts "-----------"
  puts "#{board[6]} | #{board[7]} | #{board[8]}"
end

# take player input
def select_position(board)
  current_player = 'X'
  p 'Enter your position 1-9: '
  position = gets.to_i - 1
  if board[position] == ' '
    board[position] = current_player
  else
    p 'This position is already taken'
  end
end
# check for win or tie
# switch the player
# check for win or tie again

print_board(board)
select_position(board)
print_board(board)
select_position(board)
print_board(board)
