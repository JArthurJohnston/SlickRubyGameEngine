
module SlickRubyGame
    module Scalable
        attr_writer :width, :height, :scale_x, :scale_y
        attr_accessor :parent

        def initialize
            super
            @scale_x = 1
            @scale_y = 1
            @width = 0
            @height = 0
        end

        def width
            return scale_x * @width
        end

        def height
            return scale_y * @height
        end

        def scale_x
            return parent.scale_x * @scale_x
        end

        def scale_y
            return parent.scale_y * @scale_y
        end

    end
end
