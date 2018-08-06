require_relative 'abstract_collider'

module SlickRubyGame::Colliders
    class AbstractPhysicalCollider < AbstractCollider
        attr_accessor :last_known_x, :last_known_y

        def init(game_container)
            super
            @last_known_x = parent.offset_x
            @last_known_y = parent.offset_y
        end

        def update(game_container, delta)
            super
            shape.set_x(parent.offset_x + self.offset_x)
            shape.set_y(parent.offset_y + self.offset_y)
        end

        def handle_collision
            parent.offset_x = @last_known_x
            parent.offset_y = @last_known_y
        end

        def finished_colliding
            @last_known_x = parent.offset_x
            @last_known_y = parent.offset_y
        end

    end
end