require_relative '../game_object'
require_relative 'camera_perspective'

module SlickRubyGame
    class AreaCameraPerspective < CameraPerspective
        attr_accessor :top, :bottom

        def validate_fields
            if(@bottom <= @top)
                raise 'Bottom value must be greater than top value'
            end
        end

        def top_percentage_at(percentage, position)
            @top_percentage = percentage
            @top = position
        end

        def bottom_percentage_at(percentage, position)
            @bottom_percentage = percentage
            @bottom = position
        end

        def scale_delta
            return (@bottom_percentage - @top_percentage)/(@bottom - @top)
        end

    end
end

