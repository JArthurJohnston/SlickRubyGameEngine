
module SlickRubyGame
    module Scalable
        attr_writer :width, :height
        attr_accessor :scale_x, :scale_y

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

    end
end