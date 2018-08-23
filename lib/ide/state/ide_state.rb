require_relative '../commands/command_processor'
require_relative '../../slick_ruby_game/main_game_loop'
require_relative '../ui/main_editor'


module SlickRubyGame
    module IDE
        module State
            class IDEState
                attr_accessor :game, 
                            :selected_game_object, 
                            :command_processor
                @@instance = self.new
        
                def initialize
                    @game = build_default_game
                    @selected_game_object = @game
                    @command_processor = SlickRubyGame::IDE::Commands::CommandProcessor.new(self)
                end
        
                def build_default_game
                    game = SlickRubyGame::MainGameLoop.new('New Game')
                    return game
                end
        
                def self.instance
                    return @@instance
                end
            end
        end
    end
end
