require_relative 'game_behavior'
require_relative 'game_object'
require_relative './colliders/collision_handler'

module SlickRubyGame
    class Level
        include GameBehavior
        attr_accessor :layers,
                        :current_layer

        def initialize
            @current_layer = build_default_layer
            @layers = [@current_layer]
        end

        def build_default_layer
            default_layer = GameObject.new
            default_layer.parent = self
            default_layer.identifier = 'Default Layer'
            return default_layer
        end

        def update(gc, delta)
            super
            Colliders::CollisionHandler.instance.process_collisions
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
