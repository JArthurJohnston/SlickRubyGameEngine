require_relative '../game_object'

module SlickRubyGame::Colliders
    class AbstractCollider < SlickRubyGame::GameObject
        attr_accessor :shape

        def collides_with?(other_collider)
            return shape.intersects(other_collider.shape)
        end

    end
end
