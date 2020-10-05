require './lib/helpers.rb'

describe Helpers do
    describe "#valid_move?" do
        it "Checks if player move is valid" do
            expect(subject.valid_move?("X", 10)).to be_falsey
        end
    end

    describe "#position_taken?" do
        it "Checks if position is taken" do
            expect(subject.position_taken?(9,9)).to be_truthy
        end
    end
end
