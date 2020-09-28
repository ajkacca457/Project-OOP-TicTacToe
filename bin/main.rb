#!/usr/bin/env ruby
<<<<<<< HEAD
require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/helpers'
# this is a class for excuting the game
class Tictactoe
  attr_writers :name, :board

  def initialize
    @myboard = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @game = Game.new
    @name = []
    @game_over = false
    @helpers = Helpers.new
  end

  def display_board
    puts " #{@myboard[0]} | #{@myboard[1]} | #{@myboard[2]} "
    puts '-----------'
    puts " #{@myboard[3]} | #{@myboard[4]} | #{@myboard[5]} "
    puts '-----------'
    puts " #{@myboard[6]} | #{@myboard[7]} | #{@myboard[8]} "
    puts ' '
  end

  def welcome
    puts '"Hello Gamers!"'
    puts 'Welcome to-'
    sleep 1
    puts 'TIC-TAC-TOE'
    sleep 1
    puts 'A simple game developed by Avijit and Rick'
    sleep 1
  end

  def move_board(index)
    @myboard[index] = @player.sign
  end

  def turn
    @player = @player == @name[0] ? @name[1] : @name[0]
    puts "#{@player.name}, choose a spot between 1-9"
    player_move = gets.strip.to_i
    unless player_move.positive?
      puts 'Please enter a valid move'
      player_move = gets.strip.to_i
    end
    unless @helpers.valid_move?(@myboard, @helpers.input_to_index(player_move))
      puts "#{@player.name}, Place is already taken.Choose another number between 1-9"
      player_move = gets.strip.to_i
    end
    move_board(@helpers.input_to_index(player_move))
    display_board
    if @game.won?(@myboard)
      puts "Congratulations #{@player.name} you won!!!"
      @game_over = true
    elsif @game.draw?(turn_count)
      puts 'It is a Draw!!!'
      @game_over = true
    end
  end

  def turn_count
    counter = 0
    if @myboard.include?('X')
      counter += 1
    elsif @myboard.include?('O')
      counter += 1
    else
      counter
    end
    counter
  end

  def user_name
    signs = %w[X O]
    2.times do |item|
      puts 'Please enter name of players:'
      player1 = gets.strip

      until !player1.empty? do
      puts 'Please enter a valid name'
      player1 = gets.strip.to_s
      break  if !player1.empty?
      end
      @name.push(Player.new(player1, signs[item]))
    end
    until @name[1].name != @name[0].name
      puts "Your name should be different than #{@name[0].name}:"
      player2 = gets.strip.to_s
      @name[1] = Player.new(player2, 'O')
    end
    sleep 1
  end

  def greeting
    puts "today our players are: #{@name[0].name} and #{@name[1].name}"
    sleep 1
    puts "#{@name[0].name} is going to play with 'X' symbol."
    puts "#{@name[1].name} is going to play with 'O'symbol"
    sleep 1
    puts 'your game starts at:'
    sleep 1
    3.downto(0) { |number| puts number }
    sleep 1
  end

  def execute
    welcome
    display_board
    user_name
    greeting
    turn until @game_over
  end
end


new_game = Tictactoe.new
new_game.execute

puts 'want to play again?'
answer = gets.strip.downcase

if answer == 'yes'
  game = Tictactoe.new
  game.execute
else
  puts 'Hope to see you soon'
=======
require_relative '../lib/board'
require_relative '../lib/helpers'

puts 'Welcome!! Are you ready to play tic-tac-toe?'
player_answer = gets.chomp.downcase

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
  if turn.even?
    puts 'Player 1-enter any number from 1 to 9'
    player1_move = gets.chomp
    player1_input = helpers.input_to_index(player1_move)
    until helpers.valid_move?(board.board, player1_input)
      puts 'Move is not valid. Enter number between 1 to 9 which is not taken'
      player1_move = gets.chomp
      player1_input = helpers.input_to_index(player1_move)
      break if helpers.valid_move?(board.board, player1_input)
    end
    board.board[helpers.input_to_index(player1_move)] = player1_move

  else
    puts 'Player 2-enter any number from 1 to 9'
    player2_move = gets.chomp
    player2_input = helpers.input_to_index(player2_move)
    until helpers.valid_move?(board.board, player2_input)
      puts 'Move is not valid. Enter number between 1 to 9 which is not taken'
      player2_move = gets.chomp
      player2_input = helpers.input_to_index(player2_move)
      break if helpers.valid_move?(board.board, player2_input)
    end
    board.board[helpers.input_to_index(player2_move)] = player2_move

  end
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

>>>>>>> 983b4d6f54f1ef842f5b229894f889aef5963744
end
