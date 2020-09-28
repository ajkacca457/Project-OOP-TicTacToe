#!/usr/bin/env ruby
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
end
