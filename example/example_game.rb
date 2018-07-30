require_relative '../lib/slick_ruby_game'
require_relative '../lib/slick_ruby_game/picture'

game = SlickRubyGame::MainGameLoop.new('A Day at the Station')

background = SlickRubyGame::Picture.new
background.image_location = './res/GFV_train_HD.jpg'
background.start_x = 0
background.start_y = 0

game.add_game_object(background)

game_container = AppGameContainer.new(game)
game_width = 1920
game_height  = 1080
fullscreen_game = true
game_container.set_display_mode(game_width, game_height, fullscreen_game)
game_container.start
