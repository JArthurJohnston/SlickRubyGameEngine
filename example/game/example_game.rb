require 'srge'
require 'srge/sprites'
require 'srge/colliders'
require_relative 'example_input'

# class SlickRubyGame::Colliders::AbstractCollider

#     def render(game_container, graphics)
#         super(game_container, graphics)
#         graphics.draw(self.shape)
#     end
# end


 = SlickRubyGame::MainGameLoop.new('A Day at the Station')

level = SlickRubyGame::Level.new
level.width = 1920
level.height = 1080 #these should be handled at a higher place than the level
camera_perspective = SlickRubyGame::AreaCameraPerspective.new
camera_perspective.top_percentage_at(0.1, 600)
camera_perspective.bottom_percentage_at(2, 1080)

game.add_level(level)

background = SlickRubyGame::Picture.new
background.image_location = './res/GFV_train_HD.jpg'

bounding_llama = SlickRubyGame::Sprite.new
bounding_llama.spritesheet_location = './res/llama.png'
bounding_llama.sprite_width = 48
bounding_llama.sprite_height = 48
bounding_llama.width = 128
bounding_llama.height = 128
bounding_llama.offset_x = 1200
bounding_llama.offset_y = 600
bounding_llama.animation_speed = 100
bounding_llama.movement_speed = 0.2

llama_collider = SlickRubyGame::Colliders::PhysicalRectangleCollider.new
llama_collider.width = 10
llama_collider.height = 10
llama_collider.offset_x = 54
llama_collider.offset_y = 100

movement_handler = SpriteMovementHandler.new
bounding_llama.add_game_object(movement_handler)

level.add_game_object(background)
bounding_llama.add_game_object(llama_collider)

camera_perspective.add_game_object(bounding_llama)
level.add_game_object(camera_perspective)


level.add_game_object(SlickRubyGame::Colliders::LineCollider.new(448, 1070, 1920, 1070))
level.add_game_object(SlickRubyGame::Colliders::LineCollider.new(449, 1071, 1225, 763))
level.add_game_object(SlickRubyGame::Colliders::LineCollider.new(1226, 764, 1920, 794))
level.add_game_object(SlickRubyGame::Colliders::LineCollider.new(1919, 795, 1919, 1071))

game_container = AppGameContainer.new(game)
game_width = 1920
game_height  = 1080
fullscreen_game = false
game_container.set_display_mode(game_width, game_height, fullscreen_game)
game_container.start
