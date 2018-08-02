require_relative 'game_behavior'

module SlickRubyGame
  class GameObject
    include GameBehavior
    attr_reader :game_objects
    attr_accessor :offset_x,
                  :offset_y,
                  :identifier

    def initialize
      @offset_x = 0
      @offset_y = 0
      @game_objects = []
      @identifier = ''
    end

  end
end
