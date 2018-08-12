require_relative '../game_object'

module SlickRubyGame
    class CameraPerspective < GameObject
        attr_accessor :top_percentage, :bottom_percentage

        def initialize
            super
        end

        def init(game_container)
            validate_fields
            @game_objects.each do
                |each_object|
                each_object.init(game_container)
                update_scales_for(each_object)
            end
        end

        def update_scales_for(game_object)
            scale_value = game_object.offset_y * scale_delta
            game_object.scale_x = scale_value
            game_object.scale_y = scale_value
            # This only works if the scales are equal. 
        end
        
        def update(game_container, delta)
            @game_objects.each do
                |each_object|
                each_object.update(game_container, delta)
                update_scales_for(each_object)
            end
        end

        def validate_fields
            if(self.parent.height <= 0)
                raise 'Parent height must be greater than zero'
            end
        end

        def scale_delta
            return (bottom_percentage - top_percentage)/self.parent.height
        end

    end
end
 