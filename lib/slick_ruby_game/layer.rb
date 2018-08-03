require_relative 'game_object'
require_relative './colliders/handles_colliders'

module SlickRubyGame
  class Layer < GameObject
    include Colliders::HandlesColliders
  end
end
