#!/usr/bin/env ruby
puts '"Hello world!"'

# Setting up the game initially
# Create a game board class
# Create a couple players
# Create the game class

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
# Validation of the input and convert the name to uppercase letter
# Creation of a new player object with the given name if the given name is not empty or nil

# creating players object-2
puts 'enter name of second_player'
player_two = gets.chomp
# Validation of the input and convert the name to uppercase letter
# Creation of a new player object with the given name if the given name is not empty or nil

3.downto(1) { |counter| puts "wait #{counter} second" }

puts " today our players are : #{player_one} and #{player_two}"

puts 'Lets have a toss to select who will go first..'

# A random condition will will determine who will go first. X will be assign to player1 and O will be assign to player2.
result=rand(1..2)
puts result==1 ? "#{player_one} will go first": "#{player_two} will go first"
gamer_one= result==1?player_one:player_two
gamer_two= result==1?player_two:player_one

puts "#{gamer_one} will start first with character X and #{gamer_two} will go second with character O"


3.downto(1){|counter| puts "wait #{counter} second preparing the game board"}