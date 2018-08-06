require_relative 'handles_colliders'

module SlickRubyGame::Colliders
    class CollisionHandler
        include SlickRubyGame::Colliders::HandlesColliders
        @@INSTANCE = CollisionHandler.new

        def self.instance
            return @@INSTANCE
        end

        private_class_method :new

    end
end