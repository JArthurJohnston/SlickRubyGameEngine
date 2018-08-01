require_relative '../lib/slick_ruby_game'
require_relative '../lib/slick_ruby_game/picture'
require_relative '../lib/slick_ruby_game/sprites/sprite'
require_relative '../lib/slick_ruby_game/input/input_handler'


game = SlickRubyGame::MainGameLoop.new('A Day at the Station')

background = SlickRubyGame::Picture.new
background.image_location = './res/GFV_train_HD.jpg'

bounding_llama = SlickRubyGame::Sprite.new
bounding_llama.spritesheet_location = './res/llama.png'
bounding_llama.sprite_width = 48
bounding_llama.sprite_height = 48
bounding_llama.render_width = 128
bounding_llama.render_height = 128
bounding_llama.offset_x = 1200
bounding_llama.offset_y = 900
bounding_llama.animation_speed = 100
bounding_llama.movement_speed = 0.2

class SpriteMovementHandler < SlickRubyGame::Input::AbstractInputHandler
    def event_triggered(graphics_container, delta)
        # bounding_llama var not available in this scope :(
        parent.start_moving
        movement = parent.movement_speed * delta
        parent.offset_x = parent.offset_x + movement
    end

    def event_not_triggered(gc, d)
        parent.stop_moving
        parent.reset_animation
    end
end

move_right_handler = SpriteMovementHandler.new
move_right_handler.input_type = SlickRubyGame::Input::InputType::DOWN
move_right_handler.key_code = Input::KEY_RIGHT

bounding_llama.add_game_object(move_right_handler)

game.add_game_object(background)
game.add_game_object(bounding_llama)

game_container = AppGameContainer.new(game)
game_width = 1920
game_height  = 1080
fullscreen_game = true
game_container.set_display_mode(game_width, game_height, fullscreen_game)
game_container.start
