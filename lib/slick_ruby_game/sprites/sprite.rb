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
                        :spritesheet_location,
                        :animation_speed,
                        :movement_speed

        def init(game_container)
            super
            @sprite_sheet = SpriteSheet.new(spritesheet_location, sprite_width, sprite_height)
            @sprite_sheet.set_filter(Image::FILTER_NEAREST);
            @sprite_animation = Animation.new(@sprite_sheet, animation_speed)
            @sprite_animation.stop
        end

        def render(graphics_container, graphics)
            @sprite_animation.draw(offset_x, offset_y, width, height)
            super
        end

        def close
            super
            @sprite_sheet.destroy
        end

        def start_moving
            @sprite_animation.start
        end

        def stop_moving
            @sprite_animation.stop
        end

        def reset_animation
            @sprite_animation.set_current_frame(0)
        end

    end

end