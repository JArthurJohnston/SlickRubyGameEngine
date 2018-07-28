include Java

java_import org.newdawn.slick.BasicGame

require_relative './slick_ruby_game/include_slick'

module SlickRubyGame

    class MainGameLoop < BasicGame
        attr_accessor :game_objects

        def initialize
            @game_objects = []
        end

        def update(gc, delta)
        end
        
        def init(gc)
        end
        
        def render(graphics_container, graphics)
        end

    end

    def self.start

    end
end

