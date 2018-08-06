require_relative '../game_object'
require_relative 'collision_handler'

module SlickRubyGame::Colliders
    class AbstractCollider < SlickRubyGame::GameObject
        attr_accessor :shape

        def init(game_container)
            super
            CollisionHandler.instance.add_collider(self)
        end

        def collides_with?(other_collider)
            return shape.intersects(other_collider.shape)
        end

        def handle_collision_with(other_collider)
            if(collides_with?(other_collider))
                handle_collision
            end
        end

        def handle_collision
            # Stub method, meant to be overridden
        end

        def finished_colliding
            #override
        end
    end
end
