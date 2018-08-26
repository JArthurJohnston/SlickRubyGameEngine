include Java
require_relative '../include_slick'

java_import org.newdawn.slick.Image,
            org.newdawn.slick.SpriteSheet

module SlickRubyGame
    module ContentMgmt
        class ImageFactory
            def load(file_name)
                return Image.new(file_name)
            end
        end

        class ImageManager
            attr_reader :images

            def initialize
                @image_factory = ImageFactory.new
                @images = {}
            end

            def retrieve(file_name)
                if(@images[file_name].nil?)
                    stored_image = @image_factory.load(file_name)
                    @images.store(file_name, stored_image)
                    return stored_image
                else
                    return @images[file_name]
                end
            end


            # vvv Statics
            def self.instance
                return @@instance
            end
            @@instance = ImageManager.new
            private_class_method :new
        end
    end
end