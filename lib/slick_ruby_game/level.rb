require_relative 'game_behavior'
require_relative 'layer'

module SlickRubyGame
    class Level
        include GameBehavior
        attr_accessor :layers,
                        :current_layer

        def initialize
            default_layer = Layer.new
            default_layer.identifier = 'Default'
            @current_layer = default_layer
            @layers = [default_layer]
        end

        def game_objects
            return @layers
        end

        def add_game_object(game_object)
            @current_layer.add_game_object(game_object)
        end

        def add_layer(layer)
            @layers.push(layer)
            layer.parent= self
        end

    end
end
