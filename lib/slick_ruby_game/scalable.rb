
module SlickRubyGame
    module Scalable
        attr_writer :width, :height, :scale_x, :scale_y
        attr_accessor :parent, :min_width, :min_height

        def initialize
            super
            @scale_x = 1.0
            @scale_y = 1.0
            @width = 0.0
            @height = 0.0
            @min_height = 1.0
            @min_width = 1.0
        end

        def width
            value = scale_x * @width
            return value > @min_width ? value : @min_width  
        end

        def height
            value = scale_y * @height
            return value > @min_height ? value : @min_height  
        end

        def scale_x
            return parent.scale_x * @scale_x
        end

        def scale_y
            return parent.scale_y * @scale_y
        end

        def center_x
            return offset_x + (@width / 2)
        end

        def center_y
            return offset_y + (@height / 2)
        end
    end
end
