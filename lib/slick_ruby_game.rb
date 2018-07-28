include Java
require_relative './slick_ruby_game/include_slick'

java_import org.newdawn.slick.BasicGame,
            org.newdawn.slick.AppGameContainer


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
        game_container = AppGameContainer.new(MainGameLoop.new)
        game_container.start
    end
end

SlickRubyGame.start