
module SlickRubyGame
    module GameBehavior
        attr_writer :identifier
        attr_accessor :parent

        def game_objects
            return []
        end

        def init(game_container)
            game_objects.each do
            |each_game_object|
              each_game_object.init(game_container)
            end
        end
      
        def update(game_container, delta)
          game_objects.each do
          |each_game_object|
            each_game_object.update(game_container, delta)
            each_game_object.post_update(game_container, delta)
          end
        end
    
        def post_update(game_container, delta)
          # abstract: override
        end
    
        def render(game_container, graphics)
          game_objects.each do
          |each_game_object|
            each_game_object.render(game_container, graphics)
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
            return 0.0
        end

        def offset_y
            return 0.0
        end

        def identifier
            if @identifier.nil?
                return self.class.name
            end
            return @identifier
        end

    end
end