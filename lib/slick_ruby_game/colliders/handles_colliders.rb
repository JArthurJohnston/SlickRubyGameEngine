module SlickRubyGame
  module Colliders
    module HandlesColliders

      def colliders
        if @colliders.nil?
          @colliders = []
        end
        return @colliders
      end

      def add_collider(collider)
        colliders.push(collider)
      end

      def colliders=(an_array_of_colliders)
        @colliders = an_array_of_colliders
      end

      def process_collisions
        handle_collisions_between(colliders.first, colliders)
      end

      def handle_collisions_between(a_collider, colliders)
        if(colliders.empty?)
          return
        end
        other_colliders = colliders.drop(1)
        other_colliders.each do
          |each_other_collider|
          a_collider.handle_collision_with(each_other_collider)
        end
        handle_collisions_between(other_colliders.first, other_colliders)
      end

    end
  end
end
