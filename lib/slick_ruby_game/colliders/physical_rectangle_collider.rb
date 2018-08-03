include Java
require_relative 'abstract_physical_collider'
require_relative '../../../lib/slick_ruby_game/include_slick'

java_import org.newdawn.slick.geom.Rectangle

module SlickRubyGame::Colliders
    class PhysicalRectangleCollider < AbstractPhysicalCollider
        attr_accessor :width, :height

        def init(game_container)
            super
            @shape = Rectangle.new(shape_x, shape_y ,width, height)
        end

        def shape_x
            return parent.offset_x + offset_x
        end

        def shape_y
            return parent.offset_y +  offset_y
        end

    end
end