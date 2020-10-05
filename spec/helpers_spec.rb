# frozen_string_literal: true

require './lib/helpers.rb'

describe Helpers do
  describe '#valid_move?' do
    it 'Checks if player move is invalid' do
      expect(subject.valid_move?('X', 10)).to be_falsey
    end
    it 'Checks if player move is valid' do
      expect(subject.valid_move?('X', 5)).to be_truthy
    end
  end

  describe '#position_taken?' do
    it 'Checks if position is taken' do
      expect(subject.position_taken?(9, 9)).to be_truthy
    end

    it 'Checks if position is not taken' do
      expect(subject.position_taken?('', 9)).to be_falsey
    end
  end

  describe '#input_to_index' do
    it 'Checks if user input is equal to board index' do
      expect(subject.input_to_index(2)).to eq(1)
    end
  end
end
