#!/usr/bin/env ruby
require_relative '../lib/board'
require_relative '../lib/helpers'

puts '"Hello world!"'

puts 'Welcome!! Are you ready to play tic-tac-toe?'
player_answer = gets.chomp.upcase

if player_answer == 'yes'
  puts 'welcome to the game'
else
  puts 'Hope you will return soon'
end

# creating players object-1
puts 'enter name of first_player'
player_one = gets.chomp

# creating players object-2
puts 'enter name of second_player'
player_two = gets.chomp

3.downto(1) { |counter| puts "wait #{counter} second" }

puts " today our players are : #{player_one} and #{player_two}"

puts 'Lets have a toss to select who will go first..'

# A random condition will will determine who will go first.
# X will be assign to player1 and O will be assign to player2.

result = rand(1..2)
puts result == 1 ? "#{player_one} will go first" : "#{player_two} will go first"
gamer_one = result == 1 ? player_one : player_two
gamer_two = result == 1 ? player_two : player_one

puts "#{gamer_one} will start first with character X"
puts "#{gamer_two} will go second with character O"

3.downto(1) { |counter| puts "wait #{counter} second preparing the game board" }

winning_combinations = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9],
  [1, 5, 9],
  [3, 5, 7]
]

# after setting up the board then the game will set up:

winner = nil

# board will be render for the players
board = Board.new
board.display_board
helpers = Helpers.new
game_over = false
turn = 0
# after the setup game will start a loop to get player inputs until:

until game_over
  puts 'enter any number from 1 to 9'
  player1_move = gets.chomp
  until helpers.valid_move?(board.board, helpers.input_to_index(player1_move))
    puts 'Move is not valid. Enter number between 1 to 9 which is not taken'
    player1_move = gets.chomp
    if helpers.valid_move?(board.board, helpers.input_to_index(player1_move))
      break
    end
  end
  board.board[helpers.input_to_index(player1_move)] = player1_move
  board.display_board
  turn += 1

  if board.board.include?(winning_combinations)
    puts 'congratulations player one won'
    game_over = true
    break
  elsif turn >= 9 && !winner
    puts 'the game is a draw'
    game_over = true
    break
  end

end
