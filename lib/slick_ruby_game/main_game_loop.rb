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
            @levels = {}
            @identifier = title
        end

        def init(game_container)
            @current_level.init(game_container)
        end

        def update(game_container, delta)
            @current_level.update(game_container, delta)
        end
        
        def render(game_container, graphics)
            @current_level.render(game_container, graphics)
        end

        def add_level(game_object)
            unless @levels[game_object.identifier].nil?
                raise 'A level with the identifier ' + game_object.identifier + ' already exitsts'
            end
            @levels.store(game_object.identifier, game_object)
            game_object.parent = self
            if @current_level.nil?
                @current_level = game_object
            end
        end

        def game_objects
            return @levels
        end

        def retrieve_level(level_name)
            return @levels[level_name]
        end

    end
end
