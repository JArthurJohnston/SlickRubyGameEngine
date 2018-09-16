require_relative '../game_object'

module SlickRubyGame
    module Environments
        class SlidingBackground < SlickRubyGame::GameObject
            attr_writer     :target, 
                            :picture

            attr_accessor   :camera_x, 
                            :camera_y, 
                            :camera_radius
            
            def game_objects
                return super.push(@target).push(@picture)
            end

            def target=(game_object)
                @target = game_object
                @target.parent= self
            end

            def picture=(picture)
                @picture = picture
                @picture.parent= self
            end

            def update(game_container, delta)
                super
                if(distance_between(@target.center_x, @target.center_y, camera_x, camera_y) > @camera_radius)
                    delta_x = (@target.offset_x - @camera_x) - @camera_radius
                    delta_y = (@target.offset_y - @camera_y) - @camera_radius
                    update_picture_offsets(delta_x, delta_y)
                    update_target_offsets(delta_x, delta_y)
                end
            end

            def update_picture_offsets(delta_x, delta_y)
                @picture.offset_x= @picture.offset_x + delta_x
                @picture.offset_y= @picture.offset_y + delta_y
            end

            def update_target_offsets(delta_x, delta_y)
                @target.offset_x= @target.offset_x + delta_x * -1
                @target.offset_y= @target.offset_y + delta_y * -1
            end

        end
    end
end
