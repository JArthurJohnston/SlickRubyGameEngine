require_relative 'game_behavior'

module SlickRubyGame
  class GameObject
    include GameBehavior
    attr_reader :game_objects,
                :identifier
    attr_accessor :offset_x,
                  :offset_y

    def initialize
      @offset_x = 0
      @offset_y = 0
      @game_objects = []
      @identifier = ''
    end

    def offset_x
      return parent.offset_x + @offset_x
    end

    def offset_y 
      return parent.offset_y + @offset_y
    end
    # this screwed up the collider on the llama!

  end
end
