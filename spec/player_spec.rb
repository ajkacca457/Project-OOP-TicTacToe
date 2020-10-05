require './lib/player.rb'


    describe "#initialize?" do
        it "Checks fo player & move " do
            player = Player.new('Rick', 'X')
            expect(player.instance_variable_get(:@name)).to eq('Rick')
        end

        it "Checks fo player & move " do
            player = Player.new('Rick', 'X')
            expect(player.instance_variable_get(:@sign)).to eq('X')
        end
    end

