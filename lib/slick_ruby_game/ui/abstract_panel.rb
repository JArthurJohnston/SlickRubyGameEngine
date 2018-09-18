include Java

require_relative '../game_object'
require_relative '../include_slick'

java_import org.newdawn.slick.Color,
            org.newdawn.slick.geom.RoundedRectangle

module SlickRubyGame
    module UI

        class AbstractPanel < SlickRubyGame::GameObject
            attr_reader :background_color

            def render(game_container, graphics)
                original_color = graphics.get_color
                graphics.set_color(@background_color)
                draw_shape(graphics)
                graphics.set_color(original_color)
                super
            end

            def draw_shape(graphics)
            end

            def background_color(r, g, b, a)
                @background_color = Color.new(r, g, b, a)
            end
        end

        class RoundedRectanglePanel < AbstractPanel
            attr_accessor :corner_radius

            def draw_shape(graphics)
                graphics.fill_round_rect(offset_x, offset_y, width, height, @corner_radius)
            end

        end

    end
end
