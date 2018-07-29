require_relative 'game_object'
require_relative './colliders/has_colliders'

module SlickRubyGame
  class Layer < GameObject
    include HandlesColliders
  end
end
