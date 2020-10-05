require './lib/helpers.rb'

describe Helpers do
    describe "#valid_move?" do
        it "Checks if player move is valid" do
            expect(subject.valid_move?("X", 10)).to be_falsey
        end
    end
end
