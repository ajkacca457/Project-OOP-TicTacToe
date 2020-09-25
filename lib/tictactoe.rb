require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/helpers'

class Tictactoe
  attr_accessor :name, :board

  def initialize
    @board = Board.new
    @game = Game.new
    @name = []
    @game_over = false
    @helpers = Helpers.new

  end

  def welcome
    puts 'Welcome to-'
    sleep 1
    puts "TIC-TAC-TOE"
    sleep 1
    puts "A simple game developed by Avijit and Rick"
    sleep 1
  end

  def move_board(index)
    @board.board[index] = @player.sign
  end

  def turn
      @player = @player == @name[0] ? @name[1] : @name[0]
      puts "#{@player.name}, choose a spot between 1-9"
      player_move = gets.strip.to_i
      if !player_move.positive?
        puts 'Please enter a valid move'
        player_move = gets.strip.to_i
      end
      if !@helpers.valid_move?(@board.board, @helpers.input_to_index(player_move))
        puts "#{@player.name}, choose a spot between 1-9 which is not taken"
        player_move = gets.strip.to_i
      end
      move_board(@helpers.input_to_index(player_move))
      puts `clear`
      @board.display_board



    if @game.won?(@board.board)
        puts "Congratulations #{@player.name} you won!!!"
        @game_over = true
      elsif @game.draw?(turn_count)
        puts "It is a Draw!!!"
        @game_over = true
      end
  end




  end
