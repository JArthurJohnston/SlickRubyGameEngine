
module MockHelper

    def self.build_game_object(name = 'game-object')
        game_object = double(name)
        allow(game_object).to receive(:parent=)
        return game_object
    end

end
