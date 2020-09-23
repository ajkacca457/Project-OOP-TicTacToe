#!/usr/bin/env ruby
puts '"Hello world!"'

#Setting up the game initially
    # Create a game board class
    # Create a couple players
    # Create the game class

    puts 'Welcome!! Are you ready to play tic-tac-toe?'
    player_answer=gets.chomp.upcase
    
    if player_answer=="YES" || player_answer=="Y"
      puts "welcome to the game"
    else
      puts "Hope you will return soon"
    end