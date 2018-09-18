include Java

require_relative '../game_object'
require_relative '../include_slick'

java_import org.newdawn.slick.Color,
            org.newdawn.slick.geom.RoundedRectangle

module SlickRubyGame
    module UI

        class AbstractPanel < SlickRubyGame::GameObject
            attr_reader, :background_color

            def render(game_container, graphics)
                super
                graphics.set_color(@background_color)
            end

            def background_color=(rgba_array)
                @background_color = Color.new(rgba_array[0], rgba_array[1], rgba_array[2], rgba_array[3])
            end
        end

        class RoundedRectanglePanel < AbstractPanel
            attr_accessor :corner_radius

            def render(game_container, graphics)
                super
                graphics.fill_round_rect(@offset_x, @offset_y, @width, @height, @corner_radius)
            end

        end

    end
end
