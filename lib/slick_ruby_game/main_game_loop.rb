include Java
require_relative 'include_slick'

java_import org.newdawn.slick.BasicGame


module SlickRubyGame

    class MainGameLoop < BasicGame
        attr_accessor :levels, 
                    :identifier, 
                    :current_level,
                    :can_update,
                    :width,
                    :height
        attr_reader :game_container

        def self.instance
            return @@instance
        end

        def initialize(title)
            super(title)
            @can_update = true
            @levels = {}
            @identifier = title
            @@instance = self
        end

        def init(game_container)
            @game_container = game_container
            @current_level.init(game_container)
        end

        def update(game_container, delta)
            if(@can_update)
                @current_level.update(game_container, delta)
            end
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
            return @levels.values
        end

        def retrieve_level(level_name)
            return @levels[level_name]
        end

        def transition_to(level_name)
            @can_update = false
            next_level = retrieve_level(level_name)
            if next_level.nil?
                raise 'there is no level with the identifier: ' + level_name
            end
            @current_level.close
            next_level.init(@game_container)
            @current_level = next_level
            @can_update = true
        end

    end
end
