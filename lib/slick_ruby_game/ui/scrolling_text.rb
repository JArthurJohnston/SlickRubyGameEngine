require_relative 'text'

module SlickRubyGame
    module UI
        class ScrollingText < Text
            attr_reader :elapsed_time
            attr_accessor :speed

            def initialize
                super
                @elapsed_time = 0
            end

            def update(game_container, delta)
                super
                @elapsed_time += delta
            end

            def content
                return @content[0..elapsed_time/speed]
            end

            def content=(string)
                @content = string
            end
        end
    end
end
