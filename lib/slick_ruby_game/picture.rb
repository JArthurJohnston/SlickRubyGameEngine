include Java
require_relative 'include_slick'
require_relative 'game_object'

java_import org.newdawn.slick.Image

module SlickRubyGame
  class Picture < GameObject
    attr_accessor :image_location

    def excluded_variables
      return super.push(:@image)
    end
  
    def init(graphics_container)
      super
      @image = Image.new(image_location)
    end
  
    def render(graphics_container, graphics)
      super
      @image.draw(offset_x, offset_y, width, height)
    end

    def close
      super
      @image.destroy
    end
  
  end
end