require 'srge/input'

class SpriteMovementHandler < SlickRubyGame::GameObject

    def update(gc, delta)
        super
        input = gc.get_input()
        move_distance = delta * parent.movement_speed

        is_moving_right = input.is_key_down(Input::KEY_RIGHT)
        is_moving_left = input.is_key_down(Input::KEY_LEFT)
        is_moving_up = input.is_key_down(Input::KEY_UP)
        is_moving_down = input.is_key_down(Input::KEY_DOWN)
        is_moving = (is_moving_right || is_moving_left || is_moving_up || is_moving_down)

        if is_moving
            parent.start_moving
        else
            parent.stop_moving
            parent.reset_animation
        end

        if is_moving_right
            parent.offset_x = parent.offset_x + move_distance
        end
        if is_moving_left
            parent.offset_x = parent.offset_x - move_distance
        end

        if is_moving_up
            parent.offset_y = parent.offset_y - move_distance
        end
        if is_moving_down
            parent.offset_y = parent.offset_y + move_distance
        end
    end
end
