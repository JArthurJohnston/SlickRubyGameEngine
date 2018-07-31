include Java
require_relative '../include_slick'
require_relative '../game_object'

java_import org.newdawn.slick.Image,
            org.newdawn.slick.SpriteSheet,
            org.newdawn.slick.Animation

module SlickRubyGame

    class Sprite < GameObject
        attr_accessor :sprite_width,
                        :sprite_height,
                        :render_width,
                        :render_height,
                        :spritesheet_location,
                        :animation_speed

        def init(game_container)
            @sprite_image = Image.new(spritesheet_location)
            @sprite_sheet = SpriteSheet.new(@sprite_image, sprite_width, sprite_height)
            @sprite_animation = Animation.new(@sprite_sheet, animation_speed)
            @sprite_animation.stop
        end

        def render(graphics_container, graphics)
            @sprite_animation.draw(offset_x, offset_y, render_width, render_height)
        end

    end

end