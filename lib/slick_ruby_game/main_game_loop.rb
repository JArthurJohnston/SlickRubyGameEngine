include Java
require_relative 'include_slick'

java_import org.newdawn.slick.BasicGame,
            org.newdawn.slick.AppGameContainer


module SlickRubyGame

    class MainGameLoop < BasicGame
        attr_accessor :levels, :identifier

        def initialize(title)
          super(title)
            @levels = []
        end

        def init(game_container)
            levels.each do
                |each_object|
                each_object.init(game_container)
            end
        end

        def update(game_container, delta)
            levels.each do
                |each_object|
                each_object.update(game_container, delta)
            end
        end
        
        def render(game_container, graphics)
            levels.each do
                |each_object|
                each_object.render(game_container, graphics)
            end
        end

        def add_level(game_object)
            @levels.push(game_object)
            game_object.parent = self
        end

    end

    # for testing only
    def self.start
        game_container = AppGameContainer.new(MainGameLoop.new("Simple Game"))
        game_container.start
    end
end
