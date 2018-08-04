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

      #  Get rid of this, all colliders should be added as game objects
      def colliders=(an_array_of_colliders)
        @colliders = an_array_of_colliders
      end

      def process_collisions
        handle_collisions_between(colliders.first, colliders)
      end

      def post_update(graphics_container, delta)
        process_collisions
      end

      def handle_collisions_between(a_collider, colliders)
        if(colliders.empty?)
          return
          a_collider.finished_colliding
        end
        other_colliders = colliders.drop(1)
        other_colliders.each do
          |each_other_collider|
          if(a_collider.collides_with?(each_other_collider))
            a_collider.handle_collision
            each_other_collider.handle_collision
          end
        end
        a_collider.finished_colliding
        handle_collisions_between(other_colliders.first, other_colliders)
      end


      # def process_collisions_for(collider)
      #   colliders.each do |e|
      #     if(collider != e)
      #       if(collider.collides_with?(e))
      #         collider.handle_collision
      #       end
      #     end
      #   end
      #   collider.finished_colliding
      # end

    end
  end
end
