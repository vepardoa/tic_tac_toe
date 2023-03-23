# frozen_string_literal: true

board = Array.new(9, ' ')

def print_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]}"
  puts '---+---+---'
  puts " #{board[3]} | #{board[4]} | #{board[5]}"
  puts '---+---+---'
  puts " #{board[6]} | #{board[7]} | #{board[8]}"
end

def player_selection(position_selected)
  position_selected.to_i - 1
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  return false if (board[index] == ' ') || (board[index] == '') || board[index].nil?

  true
end

print_board(board)
