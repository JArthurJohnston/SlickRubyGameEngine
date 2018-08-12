require_relative 'game_behavior'
require_relative 'scalable'

module SlickRubyGame
  class GameObject
    include GameBehavior
    include Scalable
    attr_reader :game_objects,
                :identifier
    attr_accessor :offset_x,
                  :offset_y

    def initialize
      super
      @offset_x = 0
      @offset_y = 0
      @game_objects = []
      @identifier = ''
    end

    def offset_x
      return (parent.offset_x + (delta_x * scale_x))
    end

    def offset_y 
      return (parent.offset_y + (delta_y * scale_y))
    end

    def local_offset_x
      return @offset_x
    end

    def local_offset_y
      @offset_y
    end

    def delta_x
      return local_offset_x - parent.local_offset_x
    end

    def delta_y
      return local_offset_y - parent.local_offset_y
    end

    def offset_distance
      return Math.sqrt((@offset_x - parent.offset_x)**2 + (@offset_y - parent.offset_y)**2)
    end

    def print_string
      return self.class.name + ' X: ' + offset_x.to_s + ' Y: ' + offset_y.to_s +
        ' W: ' + width.to_s + ' H: ' + height.to_s + ' SX: ' + scale_x.to_s + ' SY: ' + scale_y.to_s + 
        ' DX: ' + delta_x.to_s + ' DY: ' + delta_y.to_s
    end

  end
end
