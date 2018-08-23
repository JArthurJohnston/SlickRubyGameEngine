include Java
require_relative 'include_slick'

java_import org.newdawn.slick.BasicGame


module SlickRubyGame

    class MainGameLoop < BasicGame
        attr_accessor :levels, 
                    :identifier, 
                    :current_level

        def initialize(title)
          super(title)
            @levels = []
            @identifier = title
        end

        def init(game_container)
            @current_level= @levels.first
            @current_level.init(game_container)
        end

        def update(game_container, delta)
            @current_level.update(game_container, delta)
        end
        
        def render(game_container, graphics)
            @current_level.render(game_container, graphics)
        end

        def add_level(game_object)
            @levels.push(game_object)
            game_object.parent = self
        end

        def game_objects
            return @levels
        end

    end
end
