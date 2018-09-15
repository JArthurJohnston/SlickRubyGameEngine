require_relative '../commands/command_processor'
require_relative '../../slick_ruby_game/main_game_loop'
require_relative '../../slick_ruby_game/level'
require_relative '../../slick_ruby_game/picture'
require_relative '../ui/main_editor'


module SlickRubyGame
    module IDE
        module State
            class IDEState
                attr_accessor :game, 
                            :selected_game_object
        
                def initialize
                    @game = build_default_game
                    @selected_game_object = @game
                    @command_processor = SlickRubyGame::IDE::Commands::CommandProcessor.new(self)
                end

                def command_processor
                    return @command_processor
                end
        
                def build_default_game
                    game = SlickRubyGame::MainGameLoop.new('New Game')
                    game.width= 1920
                    game.height= 1080
                    level = SlickRubyGame::Level.new
                    level.identifier= 'Default'
                    level.width= 1920
                    level.height= 1080
                    picture = SlickRubyGame::Picture.new
                    picture.width= 1920
                    picture.height= 1080
                    picture.identifier= 'grid-background'
                    picture.image_location= './res/grid.png'

                    level.add_game_object(picture)
                    game.add_level(level)
                    return game
                end
        
                def self.instance
                    return @@instance
                end

                @@instance = IDEState.new
            end
        end
    end
end
