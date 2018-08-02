require_relative '../game_object'

module SlickRubyGame::Colliders
    class AbstractCollider < SlickRubyGame::GameObject
        attr_accessor :shape

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

        def parent=(game_object)
            super
            parent.add_collider(self)
        end

    end
end
