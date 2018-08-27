include Java
require_relative 'include_slick'
require_relative 'game_object'

java_import org.newdawn.slick.Image

module SlickRubyGame
  class Picture < GameObject
    attr_accessor :image_location
  
    def init(graphics_container)
      @image = Image.new(image_location)
    end
  
    def render(graphics_container, graphics)
      @image.draw(offset_x, offset_y)
    end

    def close
      super
      @image.destroy
    end
  
  end
end