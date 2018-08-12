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
                scale_value = each_object.offset_y * calculate_y_delta
                each_object.scale_x = scale_value
                each_object.scale_y = scale_value
            end
        end
        
        def update(game_container, delta)
            @game_objects.each do
                |each_object|
                each_object.update(game_container, delta)
                scale_value = each_object.offset_y * calculate_y_delta
                each_object.scale_x = scale_value
                each_object.scale_y = scale_value
            end
        end

        def validate_fields
            if(self.parent.height <= 0)
                raise 'Parent height must be greater than zero'
            end
        end

        def calculate_y_delta
            return (bottom_percentage - top_percentage)/self.parent.height
        end

    end
end
 