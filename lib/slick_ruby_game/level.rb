require_relative 'game_behavior'
require_relative 'game_object'
require_relative 'scalable'
require_relative './colliders/collision_handler'

module SlickRubyGame
    class Level
        include GameBehavior
        include Scalable
        attr_accessor :layers,
                        :current_layer,
                        :width,
                        :height

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

        def scale_x
            return 1
        end

        def scale_y
            return 1
        end

        def width=(width)
            @width = width
            @current_layer.width = width
        end

        def height=(height)
            @height = height
            @current_layer.height = height
        end

    end
end
