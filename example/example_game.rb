require_relative '../lib/slick_ruby_game'
require_relative '../lib/slick_ruby_game/picture'
require_relative '../lib/slick_ruby_game/sprites/sprite'

game = SlickRubyGame::MainGameLoop.new('A Day at the Station')

background = SlickRubyGame::Picture.new
background.image_location = './res/GFV_train_HD.jpg'
background.start_x = 0
background.start_y = 0

bounding_llama = SlickRubyGame::Sprite.new
bounding_llama.spritesheet_location = './res/llama.png'
bounding_llama.sprite_width = 48
bounding_llama.sprite_height = 48
bounding_llama.render_width = 128
bounding_llama.render_height = 128
bounding_llama.x_offset = 1200
bounding_llama.y_offset = 900
bounding_llama.animation_speed = 100

game.add_game_object(background)
game.add_game_object(bounding_llama)

game_container = AppGameContainer.new(game)
game_width = 1920
game_height  = 1080
fullscreen_game = true
game_container.set_display_mode(game_width, game_height, fullscreen_game)
game_container.start
