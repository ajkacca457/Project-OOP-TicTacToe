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






  end
