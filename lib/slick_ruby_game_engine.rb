include Java
require_relative './slick_ruby_game/include_slick'
require_relative 'game_object'

java_import org.newdawn.slick.BasicGame,
            org.newdawn.slick.AppGameContainer


module SlickRubyGame

    class MainGameLoop < BasicGame
        attr_accessor :game_objects

        def initialize(title)
          super(title)
            @game_objects = []
        end

        def init(graphics_container)
            game_objects.each do
                |each_object|
                each_object.init(graphics_container)
            end
        end

        def update(graphics_container, delta)
            game_objects.each do
                |each_object|
                each_object.update(graphics_container, delta)
            end
        end
        
        def render(graphics_container, graphics)
            game_objects.each do
                |each_object|
                each_object.render(graphics_container, graphics)
            end
        end

        def add_game_object(game_object)
            @game_objects.push(game_object)
            game_object.parent = self
        end

    end

    def self.start
        game_container = AppGameContainer.new(MainGameLoop.new("Simple Game"))
        game_container.start
    end
end
