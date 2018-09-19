include Java

require_relative '../game_object'
require_relative '../include_slick'

java_import org.newdawn.slick.Color

module SlickRubyGame
    module UI
        class Text < SlickRubyGame::GameObject
            attr_accessor :content

            def render(game_container, graphics)
                super
                original_color = graphics.get_color
                graphics.set_color(@color)
                graphics.draw_string(content, offset_x, offset_y)
                graphics.set_color(original_color)
            end

            def color(r, g, b, a)
                @color = Color.new(r, g, b, a)
            end
        end
    end
end
