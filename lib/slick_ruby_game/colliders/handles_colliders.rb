module SlickRubyGame
  module HandlesColliders

    def colliders
      if @colliders.nil?
        @colliders = []
      end
      return @colliders
    end

    def add_collider(collider)
      @colliders.push(collider)
    end
  end

end