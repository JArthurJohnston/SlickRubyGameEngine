require_relative '../lib/slick_ruby_game'
require_relative '../lib/slick_ruby_game/picture'
require_relative '../lib/slick_ruby_game/sprites/sprite'
require_relative '../lib/slick_ruby_game/input/input_handler'
require_relative 'example_input'


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

movement_handler = SpriteMovementHandler.new

bounding_llama.add_game_object(movement_handler)

game.add_game_object(background)
game.add_game_object(bounding_llama)

game_container = AppGameContainer.new(game)
game_width = 1920
game_height  = 1080
fullscreen_game = true
game_container.set_display_mode(game_width, game_height, fullscreen_game)
game_container.start
