require_relative '../lib/player'
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/helpers'
# this is a class for excuting the game
class Tictactoe
  attr_accessor :name, :board

  def initialize
    @board = Board.new
    @game = Game.new
    @name = []
    @game_over = false
    @helpers = Helpers.new
  end

  # rubocop:disable Layout/LineLength
  def welcome
    puts 'Welcome to-'
    sleep 1
    puts 'TIC-TAC-TOE'
    sleep 1
    puts 'A simple game developed by Avijit and Rick'
    sleep 1
  end

  def move_board(index)
    @board.board[index] = @player.sign
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def turn
    @player = @player == @name[0] ? @name[1] : @name[0]
    puts "#{@player.name}, choose a spot between 1-9"
    player_move = gets.strip.to_i
    unless player_move.positive?
      puts 'Please enter a valid move'
      player_move = gets.strip.to_i
    end
    unless @helpers.valid_move?(@board.board, @helpers.input_to_index(player_move))
      puts "#{@player.name}, Place is already taken.Choose another number between 1-9"
      player_move = gets.strip.to_i
    end
    move_board(@helpers.input_to_index(player_move))
    puts `clear`
    @board.display_board

    if @game.won?(@board.board)
      puts "Congratulations #{@player.name} you won!!!"
      @game_over = true
    elsif @game.draw?(turn_count)
      puts 'It is a Draw!!!'
      @game_over = true
    end
  end

  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def turn_count
    @board.board.select { |item| item == 'X' || item == 'O' }.size
  end

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def user_name
    signs = %w[X O]
    2.times do |item|
      puts 'Please enter name of players:'
      player1 = gets.strip
      @name.push(Player.new(player1, signs[item]))
    end
    until @name[1].name != @name[0].name
      puts "Your name should be different than #{@name[0].name}:"
      player2 = gets.strip
      @name[1] = Player.new(player2, 'O')
    end
    sleep 1
  end

  # rubocop:enable Metrics/MethodLength
  def greeting
    puts "today our players are: #{@name[0].name} and #{@name[1].name}"
    sleep 1
    puts "#{@name[0].name} is going to play with 'X' symbol and #{@name[1].name} is going to play with 'O'symbol"
    sleep 1
    puts 'your game starts at:'
    sleep 1
    3.downto(0) { |number| puts number }
    sleep 1
  end

  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Layout/LineLength
  def execute
    welcome
    @board.display_board
    user_name
    greeting
    turn until @game_over
  end
end