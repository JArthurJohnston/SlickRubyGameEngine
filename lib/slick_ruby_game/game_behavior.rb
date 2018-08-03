
module SlickRubyGame
    module GameBehavior
        attr_writer :identifier
        attr_accessor :parent

        def game_objects
            return []
        end

        def init(graphics_container)
          puts 'Initing: ' + self.class.name
          puts "\tGame Objects: " + game_objects.to_s
            game_objects.each do
            |each_game_object|
              each_game_object.init(graphics_container)
            end
        end
      
        def update(graphics_container, delta)
          game_objects.each do
          |each_game_object|
            each_game_object.update(graphics_container, delta)
            each_game_object.post_update(graphics_container, delta)
          end
        end
    
        def post_update(graphics_container, delta)
          # abstract: override
        end
    
        def render(graphics_container, graphics)
          game_objects.each do
          |each_game_object|
            each_game_object.render(graphics_container, graphics)
          end
        end
    
        def add_game_object(game_object)
          game_objects.push(game_object)
          game_object.parent= self
        end
    
        def game_objects=(game_objects)
          game_objects.each do
            |each_game_object|
            add_game_object(each_game_object)
          end
        end

        def add_collider(collider)
          parent.add_collider(collider)
        end

        def offset_x
            return 0
        end

        def offset_y
            return 0
        end

        def identifier
            if @identifier.nil?
                return self.class.name
            end
            return @identifier
        end

    end
end