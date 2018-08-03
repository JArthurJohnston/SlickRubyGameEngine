require_relative 'abstract_collider'

module SlickRubyGame::Colliders
    class AbstractPhysicalCollider < AbstractCollider
        attr_accessor :last_known_x, :last_known_y

        def init(game_container)
            @last_known_x = parent.offset_x
            @last_known_y = parent.offset_y
            @offset_x = parent.offset_x
            @offset_y = parent.offset_y
        end

        def handle_collision
            parent.offset_x = last_known_x
            parent.offset_y = last_known_y
        end

    end
end