require_relative 'game_object'
require_relative 'layer'

module SlickRubyGame
    class Level < GameObject
        attr_accessor :layers

        def initialize
            default_layer = Layer.new
            default_layer.identifier = 'Default'
            @layers = [default_layer]
        end

        def game_objects
            return @layers
        end

    end
end
