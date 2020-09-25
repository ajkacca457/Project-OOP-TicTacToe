#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/tictactoe'

puts '"Hello world!"'

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
