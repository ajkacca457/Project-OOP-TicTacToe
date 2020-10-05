require './lib/game.rb'

describe Game do
    describe "#won?" do
        it "Check if there is a winner" do
            expect(subject.won?("X")).not_to eq('TIE')
        end
    end

    describe "#draw?" do
      it "Check if there is a draw" do
        expect(subject.draw?(9)).to be_truthy
      end
      it "Check if there is not a draw" do
        expect(subject.draw?(5)).to be_falsey
      end
    end

    describe "#over?" do
        it "Checks if the game is over" do
            expect(subject.over?(9,9)).to be_truthy
        end
    end
end
