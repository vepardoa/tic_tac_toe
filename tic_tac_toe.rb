# frozen_string_literal: true

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
].freeze

board = Array.new(9, ' ')

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]}"
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]}"
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]}"
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def player_move(board, index, marker)
  board[index] = marker
end

def position_taken?(board, index)
  if board[index] == '' || board[index] == ' ' || board[index].nil?
    false
  else
    true
  end
end

def valid_move?(board, index)
  if !position_taken?(board, index) && index.between?(0, 8)
    true
  else
    false
  end
end

def current_player(board)
  turn_count(board).even? ? 'X' : 'O'
end

def turn(board)
  puts 'Please enter 1-9:'
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    player_move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |space|
    counter += 1 if %w[X O].include?(space)
  end
  counter
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    winindex1 = combo[0]
    winindex2 = combo[1]
    winindex3 = combo[2]

    position1 = board[winindex1]
    position2 = board[winindex2]
    position3 = board[winindex3]

    return combo if position1 == position2 && position2 == position3 && position_taken?(board, winindex1)
  end
  false
end

def full?(board)
  if board.any? { |index| index.nil? || index == ' ' }
    false
  else
    true
  end
end

def draw?(board)
  return true if !won?(board) && full?(board)

  won?(board)

  false
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  return board[won?(board)[0]] if won?(board)
end

def play(board)
  turn(board) until over?(board)
  if won?(board)
    winner(board) == 'X' || winner(board) == 'O'
    puts "Congratulations #{winner(board)}!"
  else
    draw?(board)
    puts "It's a tie"
  end
end

play(board)
