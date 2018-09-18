require 'srge'
require 'srge/sprites'
require 'srge/colliders'
require 'srge/file_io'
require 'srge/ui'
require_relative 'example_input'
# require_relative 'example_train_level'

java_import org.newdawn.slick.CanvasGameContainer,
            javax.swing.JFrame

class SlickRubyGame::Colliders::AbstractCollider

    def render(game_container, graphics)
        super(game_container, graphics)
        graphics.draw(self.shape)
    end
end

# class LoadingCollider < SlickRubyGame::Colliders::LineCollider
#     attr_accessor :level_name

#     def handle_collision
#         SlickRubyGame::MainGameLoop.instance.transition_to(@level_name)
#     end
# end

game = SlickRubyGame::MainGameLoop.new('A Day at the Station')
game.width= 1920
game.height= 1080

# load_workshop_collider = LoadingCollider.new(650, 1000, 1900, 1000)
# load_workshop_collider.level_name='workshop'
# load_train_collider = LoadingCollider.new(0, 1020, 1920, 1020)
# load_train_collider.level_name = 'train'

train_level = SlickRubyGame::Level.new
train_level.width = 1920
train_level.height = 1080 #these should be handled at a higher place than the level
train_background = SlickRubyGame::Picture.new
train_background.image_location = './res/GFV_train_HD.jpg'
train_background.width= game.width
train_background.height= game.height
train_level.add_game_object(train_background)
train_bottom_collider = SlickRubyGame::Colliders::LineCollider.new(650, 1010, 1860, 1010)
train_level.add_game_object(train_bottom_collider)
train_level.add_game_object(SlickRubyGame::Colliders::LineCollider.new(449, 1071, 1225, 763))
train_level.add_game_object(SlickRubyGame::Colliders::LineCollider.new(1226, 764, 1920, 794))
train_level.add_game_object(SlickRubyGame::Colliders::LineCollider.new(1919, 795, 1919, 1071))
# train_level.add_game_object(load_workshop_collider)
train_level.identifier= 'train'

workshop_level_loader = SlickRubyGame::Scripts::ScriptObject.new
workshop_level_loader.module_name= 'LevelLoader'
workshop_level_loader.file_path='./scripts/level_loader.rb'
workshop_level_loader.variables = {'@level_name': 'workshop'}
train_level.add_game_object(workshop_level_loader)

train_bottom_collider.on_collision_trigger(workshop_level_loader.script, :load_level)

workshop_level = SlickRubyGame::Level.new
workshop_level.width = 1920
workshop_level.height = 1080 #these should be handled at a higher place than the level
workshop_background = SlickRubyGame::Picture.new
workshop_background.image_location = './res/GFV_workshop_HD.jpg'
workshop_background.width= game.width
workshop_background.height= game.height
workshop_level.add_game_object(workshop_background)
workshop_level.identifier= 'workshop'
# workshop_level.add_game_object(load_train_collider)
workshop_bottom_collider = SlickRubyGame::Colliders::LineCollider.new(0, 1010, 1920, 1010)
workshop_level.add_game_object(workshop_bottom_collider)

panel = SlickRubyGame::UI::RoundedRectanglePanel.new
panel.width= 200
panel.height= 50
panel.offset_x= 200
panel.offset_y= 200
panel.corner_radius= 7
panel.background_color(88, 109, 142, 255)

text = SlickRubyGame::UI::Text.new
text.color(255, 255, 255, 255)
text.content= 'Its Alive!!!'

panel.add_game_object(text)

workshop_level.add_game_object(panel)

train_level_loader = SlickRubyGame::Scripts::ScriptObject.new
train_level_loader.module_name= 'LevelLoader'
train_level_loader.file_path='./scripts/level_loader.rb'
train_level_loader.variables = {'@level_name': 'train'}
workshop_level.add_game_object(train_level_loader)

workshop_bottom_collider.on_collision_trigger(train_level_loader.script, :load_level)

camera_perspective = SlickRubyGame::AreaCameraPerspective.new
camera_perspective.top_percentage_at(0.3, 600)
camera_perspective.bottom_percentage_at(3, 1080)

game.add_level(train_level)
game.add_level(workshop_level)

bounding_llama_1 = SlickRubyGame::Sprite.new
bounding_llama_1.spritesheet_location = './res/llama.png'
bounding_llama_1.sprite_width = 48
bounding_llama_1.sprite_height = 48
bounding_llama_1.width = 128
bounding_llama_1.height = 128
bounding_llama_1.offset_x = 1200
bounding_llama_1.offset_y = 800
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

# SlickRubyGame::Serializing::FileIO.save(train_level, './train_level.json')
# SlickRubyGame::Serializing::FileIO.save(workshop_level, './workshop_level.json')

SRGE.start(game)

# game_canvas = CanvasGameContainer.new(game)
# frame = JFrame.new('Test Game')
# frame.add(game_canvas)
# frame.set_size(800,600)
# frame.set_default_close_operation(JFrame::EXIT_ON_CLOSE)
# frame.set_visible(true)
# game_canvas.start()
