
class SlickRubyGame.GameObject
    attr_accessor :game_objects

    def initialize
        @game_objects = []
    end

    def init(graphics_container)
        @game_objects.each do
            |each_game_object|
            each_game_object.init(graphics_container)
        end
    end

    def update(graphics_container, delta)
        @game_objects.each do
            |each_game_object|
            each_game_object.update(graphics_container, delta)
        end
    end
    
    def render(graphics_container, graphics)
        @game_objects.each do
            |each_game_object|
            each_game_object.render(graphics_container, graphics)
        end
    end

end