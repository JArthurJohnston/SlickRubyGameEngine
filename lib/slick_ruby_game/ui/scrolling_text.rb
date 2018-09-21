require_relative 'text'

module SlickRubyGame
    module UI
        class ScrollingText < Text
            attr_reader :elapsed_time, :is_updating
            attr_accessor :speed

            def initialize
                super
                @elapsed_time = 0
                @is_updating = true
            end

            def start
                @is_updating = true
            end

            def stop
                @is_updating = false
            end

            def update(game_container, delta)
                super
                if(@is_updating)
                    @elapsed_time += delta
                end
            end

            def content
                return @content[0..elapsed_time/speed]
            end
        end
    end
end
