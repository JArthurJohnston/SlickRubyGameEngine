require_relative '../game_object'
require_relative 'collision_handler'

module SlickRubyGame::Colliders
    class AbstractCollider < SlickRubyGame::GameObject
        class CollisionTrigger
            attr_accessor :game_object, :triggered_method
        end

        attr_accessor :shape
        attr_reader :collision_triggers, :finished_triggers

        def initialize
            super
            @collision_triggers = []
            @finished_triggers = []
        end

        def init(game_container)
            super
            CollisionHandler.instance.add_collider(self)
        end

        def collides_with?(other_collider)
            return shape.intersects(other_collider.shape)
        end

        def handle_collision_with(other_collider)
            if(collides_with?(other_collider))
                handle_collision
            end
        end

        def on_collision_trigger(game_object, triggered_method)
            trigger = CollisionTrigger.new
            trigger.game_object = game_object
            trigger.triggered_method = triggered_method
            @collision_triggers.push(trigger)
        end

        def on_finished_colliding(game_object, triggered_method)
            trigger = CollisionTrigger.new
            trigger.game_object = game_object
            trigger.triggered_method = triggered_method
            @finished_triggers.push(trigger)
        end

        def close
            super
            CollisionHandler.instance.remove_collider(self)
        end

        def handle_collision
            # Stub method, meant to be overridden
            @collision_triggers.each do
                |each_trigger|
                each_trigger.game_object.send(each_trigger.triggered_method)
            end
        end

        def finished_colliding
            #override
            @finished_triggers.each do
                |each_trigger|
                each_trigger.game_object.send(each_trigger.triggered_method)
            end
        end
    end
end
