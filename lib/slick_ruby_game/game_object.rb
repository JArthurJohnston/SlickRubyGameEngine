
module SlickRubyGame

  class GameObject
    attr_reader :game_objects
    attr_accessor :parent,
                  :offset_x,
                  :offset_y

    def initialize
      @offset_x = 0
      @offset_y = 0
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
        each_game_object.post_update(graphics_container, delta)
      end
    end

    def post_update(graphics_container, delta)
    end

    def render(graphics_container, graphics)
      @game_objects.each do
      |each_game_object|
        each_game_object.render(graphics_container, graphics)
      end
    end

    def add_game_object(game_object)
      @game_objects.push(game_object)
      game_object.parent= self
    end

    def game_objects=(game_objects)
      game_objects.each do
        |each_game_object|
        self.add_game_object(each_game_object)
      end

    end

  end

end