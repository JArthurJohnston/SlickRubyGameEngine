require 'srge'
require 'srge/sprites'
require 'srge/colliders'
require_relative 'example_input'
# require_relative 'example_train_level'

class SlickRubyGame::Colliders::AbstractCollider

    def render(game_container, graphics)
        super(game_container, graphics)
        graphics.draw(self.shape)
    end
end

class LoadingCollider < SlickRubyGame::Colliders::LineCollider
    attr_accessor :level_name

    def handle_collision
        SlickRubyGame::MainGameLoop.instance.transition_to(@level_name)
    end
end

game = SlickRubyGame::MainGameLoop.new('A Day at the Station')

load_workshop_collider = LoadingCollider.new(650, 1000, 1900, 1000)
load_workshop_collider.level_name='workshop'
load_train_collider = LoadingCollider.new(0, 1020, 1920, 1020)
load_train_collider.level_name = 'train'

train_level = SlickRubyGame::Level.new
train_level.width = 1920
train_level.height = 1080 #these should be handled at a higher place than the level
train_background = SlickRubyGame::Picture.new
train_background.image_location = './res/GFV_train_HD.jpg'
train_level.add_game_object(train_background)
train_level.add_game_object(SlickRubyGame::Colliders::LineCollider.new(448, 1070, 1920, 1070))
train_level.add_game_object(SlickRubyGame::Colliders::LineCollider.new(449, 1071, 1225, 763))
train_level.add_game_object(SlickRubyGame::Colliders::LineCollider.new(1226, 764, 1920, 794))
train_level.add_game_object(SlickRubyGame::Colliders::LineCollider.new(1919, 795, 1919, 1071))
train_level.add_game_object(load_workshop_collider)
train_level.identifier= 'train'

workshop_level = SlickRubyGame::Level.new
workshop_level.width = 1920
workshop_level.height = 1080 #these should be handled at a higher place than the level
workshop_background = SlickRubyGame::Picture.new
workshop_background.image_location = './res/GFV_workshop_HD.jpg'
workshop_level.add_game_object(workshop_background)
workshop_level.identifier= 'workshop'
workshop_level.add_game_object(load_train_collider)

camera_perspective = SlickRubyGame::AreaCameraPerspective.new
camera_perspective.top_percentage_at(0.1, 600)
camera_perspective.bottom_percentage_at(2, 1080)

game.add_level(train_level)
game.add_level(workshop_level)

bounding_llama_1 = SlickRubyGame::Sprite.new
bounding_llama_1.spritesheet_location = './res/llama.png'
bounding_llama_1.sprite_width = 48
bounding_llama_1.sprite_height = 48
bounding_llama_1.width = 128
bounding_llama_1.height = 128
bounding_llama_1.offset_x = 1200
bounding_llama_1.offset_y = 600
bounding_llama_1.animation_speed = 100
bounding_llama_1.movement_speed = 0.2
bounding_llama_1.identifier= 'llama 1'

llama_collider_1 = SlickRubyGame::Colliders::PhysicalRectangleCollider.new
llama_collider_1.width = 10
llama_collider_1.height = 10
llama_collider_1.offset_x = 54
llama_collider_1.offset_y = 100

movement_handler_1 = SpriteMovementHandler.new

bounding_llama_1.add_game_object(movement_handler_1)
bounding_llama_1.add_game_object(llama_collider_1)

camera_perspective.add_game_object(bounding_llama_1)
train_level.add_game_object(camera_perspective)

bounding_llama_2 = SlickRubyGame::Sprite.new
bounding_llama_2.spritesheet_location = './res/llama.png'
bounding_llama_2.sprite_width = 48
bounding_llama_2.sprite_height = 48
bounding_llama_2.width = 128
bounding_llama_2.height = 128
bounding_llama_2.offset_x = 1200
bounding_llama_2.offset_y = 600
bounding_llama_2.animation_speed = 100
bounding_llama_2.movement_speed = 0.2
bounding_llama_2.identifier= 'llama 2'

llama_collider_2 = SlickRubyGame::Colliders::PhysicalRectangleCollider.new
llama_collider_2.width = 10
llama_collider_2.height = 10
llama_collider_2.offset_x = 54
llama_collider_2.offset_y = 100
llama_collider_2.identifier = 'llama collider 2'

movement_handler_2 = SpriteMovementHandler.new
bounding_llama_2.add_game_object(movement_handler_2)
bounding_llama_2.add_game_object(llama_collider_2)

workshop_level.add_game_object(bounding_llama_2)

SRGE.start(game)
