include Java
require_relative 'abstract_physical_collider'
require_relative '../../../lib/slick_ruby_game/include_slick'

java_import org.newdawn.slick.geom.Rectangle

module SlickRubyGame::Colliders
    class PhysicalRectangleCollider < AbstractPhysicalCollider

        def init(game_container)
            super
            @shape = Rectangle.new(offset_x, offset_y ,width, height)
        end

        def update(game_container, delta)
            super
            puts print_string
            @shape.set_width(width)
            @shape.set_height(height)
        end

    end
end