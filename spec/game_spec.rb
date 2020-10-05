# frozen_string_literal: true

require './lib/game.rb'

describe Game do
  describe '#won?' do
    board_win = ['X', 'X', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
    board_continue = ['X', 'O', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
    it 'Check if there is a winner' do
      expect(subject.won?(board_win)).to be_truthy
    end
    it 'Check if there is not a winner' do
      expect(subject.won?(board_continue)).to be_falsey
    end
  end

  describe '#draw?' do
    it 'Check if there is a draw' do
      expect(subject.draw?(9)).to be_truthy
    end
    it 'Check if there is not a draw' do
      expect(subject.draw?(5)).to be_falsey
    end
  end

  describe '#over?' do
    board_over = ['X', 'X', 'O', 'O', 'O', 'X', 'X', 'O', 'X']

    it 'Checks if the game is over' do
      expect(subject.over?(board_over, 9)).to be_truthy
    end
    it 'Checks if the game is not over' do
      expect(subject.over?(board_over, 5)).to be_falsey
    end
  end
end
