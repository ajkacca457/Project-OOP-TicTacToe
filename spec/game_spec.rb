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
    end
end
