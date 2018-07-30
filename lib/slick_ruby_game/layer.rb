require_relative 'game_object'
require_relative './colliders/handles_colliders'

module SlickRubyGame
  class Layer < GameObject
    include Colliders::HandlesColliders

    def post_update(graphics_container, delta)
      process_collisions
    end

  end
end
