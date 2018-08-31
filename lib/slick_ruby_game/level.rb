require_relative 'game_behavior'
require_relative 'game_object'
require_relative 'scalable'
require_relative './serializing/serializable'
require_relative './colliders/collision_handler'

module SlickRubyGame
    class Level < GameObject
        include Scalable
        attr_accessor :layers,
                        :current_layer,
                        :width,
                        :height

        def initialize
            super
            @current_layer = build_default_layer
            @game_objects.push(@current_layer)
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

        def add_game_object(game_object)
            @current_layer.add_game_object(game_object)
        end

        def add_layer(layer)
            @game_objects.push(layer)
            layer.parent= self
        end

        def layers
            return @game_objects
        end

        def scale_x
            return @scale_x
        end

        def scale_y
            return @scale_y
        end

        def offset_x
            return @offset_x
        end

        def offset_y
            return @offset_y
        end

        def width=(width)
            @width = width
            @current_layer.width = width
        end

        def height=(height)
            @height = height
            @current_layer.height = height
        end

        def level
            return self
        end

    end
end
